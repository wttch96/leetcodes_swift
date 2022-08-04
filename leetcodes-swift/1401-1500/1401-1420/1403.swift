//
//  1403.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/8/4.
//

import Foundation

///
/// 1403. 非递增顺序的最小子序列
///
/// 先排序, 遍历数组sum, 然后倒序求和, 大于sum/2后, 返回该元素到最后所有元素即可
///
class Solution1403 {
    func minSubsequence(_ nums: [Int]) -> [Int] {
        let sortedNums = nums.sorted()
        // 求和
        let sum = sortedNums.reduce(0, +)
        var res: [Int] = []
        var s = 0
        for i in stride(from: nums.count - 1, through: 0, by: -1) {
            // 贪心
            s += sortedNums[i]
            res.append(sortedNums[i])
            if sum - s < s {
                break
            }
        }
        
        return res
    }
}
