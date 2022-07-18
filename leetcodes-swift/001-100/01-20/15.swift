//
//  15.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/18.
//

import Foundation


///
/// 15. 三数之和
///
/// 先对数组排序, 遍历数字, 然后前后两个指针进行寻找
///
class Solution15 {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var res: [[Int]] = []
        for i in 0..<nums.count {
            let num_i = nums[i]
            if num_i > 0 {
                return res
            }
            
            // 去重
            if i > 0 && num_i == nums[i - 1] {
                continue
            }
            
            var left = i + 1
            var right = nums.count - 1
            while right > left {
                if num_i + nums[left] + nums[right] > 0 {
                    right -= 1
                } else if num_i + nums[left] + nums[right] < 0 {
                    left += 1
                } else {
                    res.append([num_i, nums[left], nums[right]])
                    // 去重
                    while right > left && nums[right] == nums[right - 1] {
                        right -= 1
                    }
                    while right > left && nums[left] == nums[left + 1] {
                        left += 1
                    }
                    right -= 1
                    left += 1
                }
            }
        }
        return res
    }
}
