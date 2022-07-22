//
//  55.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/22.
//

import Foundation

///
/// 55. 跳跃游戏
///
class Solution55 {
    func canJump(_ nums: [Int]) -> Bool {
        if nums.count == 1 {
            return true
        }
        if nums[0] >= nums.count {
            return true
        }
        
        var maxLength = 0
        
        for (i, num) in nums.enumerated() {
            // 能到达的最远地方
            maxLength = max(maxLength, i + num)
            if i == maxLength {
                // 可能永远到不了?
                return false
            }
            if maxLength >= nums.count - 1 {
                return true
            }
        }
        
        return false
    }
}
