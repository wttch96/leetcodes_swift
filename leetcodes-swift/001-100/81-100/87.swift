//
//  87.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/26.
//

import Foundation

///
/// 87. 扰乱字符串
///
/// 区间动态规划:
/// dp[i1][i2][len] 表示 s[i1]到s[i1+len] 和  t[i2]到 t[i2+len] 两个区间内的字符串是否满足条件
/// 枚举区间, 在区间内拆分 S ---> S1, S2, T ---> T1, T2
/// 任意拆分满足:
///     第一种情况：S1 -> T1, S2 -> T2
///     第二种情况：S1 -> T2, S2 -> T1
/// 两种情况之一则说明可以满足
///
class Solution87 {
    
    static func test() {
        let solution = Solution87()
        print(solution.isScramble("a", "a"))
    }
    
    func isScramble(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        guard s.count != 1 else { return s == t }
        
        let n = s.count
        let sChars = s.map({ $0 })
        let tChars = t.map({ $0 })
        
        var dp = Array(repeating: Array(repeating: Array(repeating: false, count: n + 1), count: n), count: n)
        // 初始化
        for i in 0..<n {
            for j in 0..<n {
                // 长度为1代表取当前一个字符
                dp[i][j][1] = sChars[i] == tChars[j]
            }
        }
        // 取 s[i...i+len] 和 t[i...i+len]
        for len in 2...n {
            for i in 0...n-len {
                for j in 0...n-len {
                    // 拆分区间
                    for splitLen in 1..<len {
                        // S1 -> T1, S2 -> T2
                        // S1:i                 T1:i                splitLen
                        // S1:i+splitLen        T2:i+splitLen       len-splitLen
                        // 0 --(splitLen)-- splitLen --(len-splitLen)-- len
                        if dp[i][j][splitLen] && dp[i + splitLen][j + splitLen][len - splitLen] {
                            dp[i][j][len] = true
                            break
                        }
                        // S1 -> T2, S2 -> T1
                        // S1 -> T1, S2 -> T2
                        // S1:i                 T1:j+(len-splitLen)       splitLen
                        // S1:i+splitLen        T2:j                      len-splitLen
                        // 0 --(splitLen)-- splitLen --(len-splitLen)-- len
                        if dp[i][j + len - splitLen][splitLen] && dp[i + splitLen][j][len - splitLen] {
                            dp[i][j][len] = true
                            break
                        }
                    }
                }
            }
        }
        
        return dp[0][0][n]
    }
}
