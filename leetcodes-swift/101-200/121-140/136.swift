//
//  136.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/13.
//

import Foundation

///
/// 136. 只出现一次的数字
///
/// 交换律：a ^ b ^ c <=> a ^ c ^ b
/// 任何数于0异或为任何数 0 ^ n => n
/// 相同的数异或为0: n ^ n => 0
///
/// var a = [2,3,2,4,4]
///
/// 2 ^ 3 ^ 2 ^ 4 ^ 4等价于 2 ^ 2 ^ 4 ^ 4 ^ 3 => 0 ^ 0 ^3 => 3
///

class Solution136 {
    func singleNumber(_ nums: [Int]) -> Int {
        var res = 0
        for num in nums {
            res ^= num
        }
        return res
    }
}
