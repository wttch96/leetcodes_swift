//
//  72.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/23.
//

import Foundation

///
/// 72. 编辑距离
///
class Solution72 {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        // 处理特殊的东西
        if word1.isEmpty { return word2.count }
        if word2.isEmpty { return word1.count }
        
        let m = word1.count
        let n = word2.count
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
        let chars1: [Character] = word1.map({ $0 })
        let chars2: [Character] = word2.map({ $0 })
        for i in 0..<m { dp[i][0] = i }
        for i in 1..<n { dp[0][i] = i }
        
        
        for i in 1...m {
            for j in 1...n {
                // 元素相等, 那就不需要变换
                if chars1[i - 1] == chars2[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1]
                } else {
                    // 元素不一样, 得变换一次, 找最小的就行了
                    dp[i][j] = 1 + min(dp[i - 1][j - 1], min(dp[i - 1][j], dp[i][j - 1]))
                }
            }
        }
        
        return dp[m][n]
    }
}
