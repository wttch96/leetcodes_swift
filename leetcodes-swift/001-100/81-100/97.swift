//
//  97.swift
//  leetcodes-swift
//
//  Created by Wttch on 2023/11/4.
//

import Foundation

///
/// 97. 交错字符串
///
///
///
class Solution97 {
    
    fileprivate init() {}
    
    
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        return isInterleave2(s1, s2, s3)
    }
    
    /// 动态规划
    func isInterleave1(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        let n = s1.count, m = s2.count
        let s1 = Array(s1), s2 = Array(s2), s3 = Array(s3)
        guard n + m == s3.count else { return false }
        
        var dp = Array(repeating: Array(repeating: false, count: m + 1), count: n + 1)
        dp[0][0] = true

        for i in 0...n {
            for j in 0...m {
                let p = i + j - 1
                // s1 的 i - 1 位 和 s3 的 i + j - 1 位一致
                if i > 0 {
                    dp[i][j] = dp[i][j] || (dp[i - 1][j] && s1[i - 1] == s3[p] )
                }
                // s2 的 j - 1 位 和 s3 的 i + j - 1 位一致
                if j > 0 {
                    dp[i][j] = dp[i][j] || (dp[i][j - 1] && s2[j - 1] == s3[p])
                }
            }
        }
        
        return dp[n][m]
    }
    
    /// 滚动数组。
    ///
    func isInterleave2(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        let n = s1.count, m = s2.count
        let s1 = Array(s1), s2 = Array(s2), s3 = Array(s3)
        guard n + m == s3.count else { return false }
        
        var dp = Array(repeating: false, count: m + 1)
        dp[0] = true

        for i in 0...n {
            for j in 0...m {
                let p = i + j - 1
                // s1 的 i - 1 位 和 s3 的 i + j - 1 位一致
                if i > 0 {
                    dp[j] = dp[j] && (s1[i - 1] == s3[p])
                }
                // s2 的 j - 1 位 和 s3 的 i + j - 1 位一致
                if j > 0 {
                    dp[j] = dp[j] || (dp[j - 1] && s2[j - 1] == s3[p])
                }
            }
        }
        
        return dp.last!
    }
    
    static func test() {
        let solution = Solution97()
        
        assert(solution.isInterleave("aabcc", "dbbca", "aadbbcbcac"))
        assert(solution.isInterleave("", "", ""))
        assert(!solution.isInterleave("aabcc", "dbbca", "aadbbbaccc"))
    }
}
