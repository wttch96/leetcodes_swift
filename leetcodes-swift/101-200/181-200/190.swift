//
//  190.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/18.
//

import Foundation

///
/// 190. 颠倒二进制位
///
class Solution190 {
    func reverseBits(_ n: Int) -> Int {
        var sum = 0
        for i in 0..<32 {
            // (n >> i) & 1 第 i 位
            // << (31 - i) 将其放到 31 - i 的地方去, 算是翻转了i位, 全翻转一遍就是结果了
            let bitI = ((n >> i) & 1) << (31 - i)
            sum += bitI
        }
        return sum
    }
}
