//
//  191.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/18.
//

import Foundation

///
/// 191. 位1的个数
///
/// 汉明重量, SWAR 算法
///
class Solution191 {
    func hammingWeight(_ n: Int) -> Int {
        var n = n
        // 01 两个一组
        n = (n & 0x55555555) + ((n >> 1) & 0x55555555)
        // 0011 四个一组
        n = (n & 0x33333333) + ((n >> 2) & 0x33333333)
        // 00001111 八个一组
        n = (n & 0x0f0f0f0f) + ((n >> 4) & 0x0f0f0f0f)
        // 0000000011111111 十六个一组
        n = (n & 0x00ff00ff) + ((n >> 8) & 0x00ff00ff)
        // 0000000000000000111111111111111 三十二个一组
        n = (n & 0x0000ffff) + ((n >> 16) & 0x0000ffff)
        return n
    }
}
