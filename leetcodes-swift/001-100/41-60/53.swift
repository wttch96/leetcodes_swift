//
//  53.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/7.
//

import Foundation

///
/// 53. 最大子数组和
///
class Solution53 {
    func maxSubArray(_ nums: [Int]) -> Int {
        var res = nums[0]
        var sum = 0
        for num in nums {
            if sum > 0 {
                sum += num
            } else {
                sum = num
            }
            // 保留从上一个sum小于0到当前位置的和的最大值
            // 或者抛弃之前的只保留当前数值（当前数值比和还打）
            res = max(res, sum);
        }
        return res
    }
}
