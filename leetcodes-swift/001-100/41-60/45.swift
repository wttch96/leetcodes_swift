//
//  File.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/21.
//

import Foundation


///
/// 45. 跳跃游戏 II
///
class Solution45 {
    func jump(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            // 一个元素直接结束
            return 0
        }
        if nums[0] >= nums.count {
            // 大于长度, 1次就够
            return 1
        }
        
        var step = 0
        var maxLength = nums[0]
        var length = 0
        for i in 0..<nums.count {
            // 最大长度
            maxLength = max(i + nums[i], maxLength)
            if maxLength >= nums.count - 1 {
                // 超出
                return step + 1
            }
            if i == length {
                // 上一次能到的位置
                step += 1
                length = maxLength
            }
        }
        
        return step
    }
}
