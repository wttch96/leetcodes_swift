//
//  1374.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/8/1.
//

import Foundation

///
/// 1374. 生成每种字符都是奇数个的字符串
///
class Solution1374 {
    func generateTheString(_ n: Int) -> String {
        if n % 2 == 1{
            return String(repeating: "a", count: n)
        } else {
            return String(repeating: "a", count: n - 1) + "b"
        }
    }
}
