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
        
        var nums = [1,1,2]
        print("leetcode before: nums = \(nums)")
        let k = self.removeDuplicates(&nums)
        print("leetcode after: nums = \(nums) k = \(k)")
    }

    // 26. 删除有序数组中的重复项
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        
        if nums.count == 1 {
            return 1
        }
        
        var i = nums.count - 2
        var temp = nums[nums.count - 1]
        while i >= 0 {
            if nums[i] == temp {
                nums.remove(at: i)
            } else {
                temp = nums[i]
            }
            
            i -= 1
        }
        
        return nums.count
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

