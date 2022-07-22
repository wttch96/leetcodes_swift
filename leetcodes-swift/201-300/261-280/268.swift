//
//  268.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/23.
//

import Foundation

///
/// 268. 丢失的数字
///
class Solution268 {
    func missingNumber(_ nums: [Int]) -> Int {
        var res = nums.count
        for (i, num) in nums.enumerated() {
            res ^= num
            res ^= i
        }
        return res
    }
}
