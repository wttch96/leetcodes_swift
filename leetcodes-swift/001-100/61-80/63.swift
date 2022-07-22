//
//  63.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/22.
//

import Foundation

///
/// 63. 不同路径 II
///
/// 动态规划:
/// 遇到障碍
///     grid[i][j] == 1
///     dp[i][j] = 0
/// 正常情况
///     grid[i][j] == 0
///     dp[i][j] = dp[i-1][j] + dp[i][j-1]
///
class Solution63 {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        guard obstacleGrid[0][0] != 1 else { return 0 }
        let m = obstacleGrid.count
        let n = obstacleGrid[0].count
        var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
        
        // 初始化第一列
        for i in 0..<m {
            if obstacleGrid[i][0] == 0 {
                dp[i][0] = 1
            } else {
                break
            }
        }
        
        // 初始化第一行
        for i in 0..<n {
            if obstacleGrid[0][i] == 0 {
                dp[0][i] = 1
            } else {
                break
            }
        }
        
        for i in 1..<m {
            for j in 1..<n {
                if obstacleGrid[i][j] == 1 {
                    // 障碍物
                    dp[i][j] = 0
                } else {
                    // 上下可以过来的和
                    dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
                }
            }
        }
        
        return dp[m - 1][n - 1]
    }
}
