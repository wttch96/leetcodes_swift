//
//  16.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/18.
//

import Foundation

///
/// 16. 最接近的三数之和
///
class Solution16 {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let nums = nums.sorted()
        // 用 Int.max 好像会溢出
        var res = nums[0] + nums[1] + nums[2]
        for i in 0..<nums.count {
            let numI = nums[i]
            // 双指针
            var left = i + 1
            var right = nums.count - 1
            while right > left {
                let numL = nums[left]
                let numR = nums[right]
                let sum = numI + numL + numR
                // 判断最接近的值
                if abs(sum - target) < abs(res - target) {
                    res = sum
                }
                if sum > target {
                    right -= 1
                } else if sum < target {
                    left += 1
                } else {
                    return target
                }
            }
        }
        return res
    }
}
