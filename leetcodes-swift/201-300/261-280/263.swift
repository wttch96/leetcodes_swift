//
//  263.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/23.
//

import Foundation

///
/// 263. 丑数
///
class Solution263 {
    func isUgly(_ n: Int) -> Bool {
        guard n > 0 else {
            return false
        }
        var num = n
        while num % 5 == 0 {
            num /= 5
        }
        while num % 3 == 0 {
            num /= 3
        }
        while num % 2 == 0 {
            num /= 2
        }
        return num == 1
    }
}
