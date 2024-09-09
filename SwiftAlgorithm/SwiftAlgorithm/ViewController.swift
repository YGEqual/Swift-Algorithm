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
        
        let nums = [1,0,1,0,1,0,1,1]
        print("leetcode before: nums = \(nums)")
        let k = self.majorityElement(nums)
        print("leetcode after: nums = \(nums) k = \(k)")
    }

    /// 169. 多数元素 - 摩尔投票算法实现
    func majorityElement(_ nums: [Int]) -> Int {
        //你可以假设数组是非空的，并且给定的数组总是存在多数元素。
        /* 这里所谓的多数元素(element)可以通过摩尔投票来发现，即每次选择第一个元素假定为element
         然后依次遍历元素，如果相等则+1票否则-1票，最后如果选的element是对的那么count就不会
         为0，如果一开始选的element是错的，无非就是非X的自我消耗，真正的element依然是最多的 */
        if nums.count < 2 {
            return nums[0]
        }
        
        var count = 1
        var element = nums[0]
        
        for i in 1 ..< nums.count {
            if count == 0 {
                element = nums[i]
            }
            
            if element == nums[i] {
                count += 1
            } else {
                count -= 1
            }
        }
        
        return element
    }
    
    /// 80. 删除有序数组中的重复项 II
    func removeDuplicatesII(_ nums: inout [Int]) -> Int {
        // 边界情况处理
        if nums.count < 3 {
            return nums.count
        }
        // 初始化写入索引
        var index = 2
        
        for i in 2 ..< nums.count {
            // 如果当前元素与前两个元素不同，写入当前元素
            if nums[i] != nums[index - 2] {
                nums[index] = nums[i]
                index += 1
            }
        }
        
        // 返回新数组的长度
        return index
    }
    
    /// 26. 删除有序数组中的重复项
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

