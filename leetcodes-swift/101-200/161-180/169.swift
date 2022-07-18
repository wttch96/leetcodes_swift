//
//  169.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/17.
//

import Foundation


///
///  169. 多数元素
///
/// 摩尔投票法,先假设第一个数过半数并设cnt=1；遍历后面的数如果相同则cnt+1，不同则减一，当cnt为0时则更换新的数字为候选数（成立前提：有出现次数大于n/2的数存在）
///
class Solution169 {
    func majorityElement(_ nums: [Int]) -> Int {
        var res = nums[0]
        var count = 1
        for i in 1..<nums.count {
            if nums[i] == res {
                count += 1
            } else {
                count -= 1
                if count == 0 {
                    res = nums[i + 1]
                }
            }
        }
        return res
    }
}
