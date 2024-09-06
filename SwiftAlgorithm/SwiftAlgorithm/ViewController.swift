//
//  ViewController.swift
//  SwiftAlgorithm
//
//  Created by echo on 2024/9/6.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


    /// 合并两个有序数组
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i = m - 1
        var j = n - 1
        var k = m + n - 1
        
        while i >= 0 && j >= 0 {
            if nums1[i] >= nums2[j] {
                nums1[k] = nums1[i]
                i -= 1
            } else {
                nums1[k] = nums2[j]
                j -= 1
            }
            k -= 1
        }
        
        while j >= 0 {
            nums1[k] = nums2[j]
            j -= 1
            k -= 1
        }
    }
    
    /// 移除元素
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var i = nums.count - 1
        
        while i >= 0 {
            if nums[i] == val {
                nums.remove(at: i)
            }
            
            i -= 1
        }
        
        return nums.count
    }
}

