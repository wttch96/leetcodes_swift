//
//  44.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/22.
//

import Foundation

///
/// 44. 通配符匹配
///
/// 动态规划:貌似速度不怎么滴, 可能还有优化的地方. 就当练习 dp 了
/// 有利用*拆分然后贪心做的好像速度很可以
///
class Solution44 {
    
    static func test() {
        let solution = Solution44()
        assert(solution.isMatch("adceb", "*a*b"))
        assert(solution.isMatch("aa", "*"))
        assert(!solution.isMatch("cb", "?a"))
        assert(!solution.isMatch("acdcb", "a*c?b"))
        assert(!solution.isMatch("aab", "c*a*b"))
        assert(solution.isMatch("", "******"))
        assert(solution.isMatch("abcabczzzde", "*abc???de*"))
        assert(!solution.isMatch("mississippi", "m??*ss*?i*pi"))
        assert(solution.isMatch("ho", "**ho"))
    }
    
    func isMatch(_ s: String, _ p: String) -> Bool {
        if s.isEmpty {
            return p.isEmpty ? true : p == String(repeating: "*", count: p.count)
        } else if p.isEmpty {
            return false
        }
        
        let m = p.count
        let n = s.count
        var dp = Array(repeating: Array(repeating: false, count: n + 1), count: m + 1)
        dp[0][0] = true
        
        if p.starts(with: "*") {
            dp[1] = Array(repeating: true, count: n + 1)
        }
        
        for (i, pChar) in p.enumerated() {
            var star = false
            for (j, sChar) in s.enumerated() {
                let r = i + 1
                let c = j + 1
                if pChar == "*" {
                    // 星号
                    if dp[i][0] {
                        // 前面没有或者都是星号
                        dp[r] = Array(repeating: true, count: n + 1)
                    }
                    if dp[i][c] {
                        // 出现星号
                        star = true
                    }
                    if star {
                        // 后续都可以匹配上
                        dp[r][c] = true
                    }
                } else if pChar == "?" || pChar == sChar {
                    // ? 或者相等
                    dp[r][c] = dp[i][j]
                }
            }
        }
    
        return dp[m][n]
    }
}
