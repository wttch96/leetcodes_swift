//
//  64.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/22.
//

import Foundation

///
/// 64. 最小路径和
///
class Solution64 {
    static func test() {
        let solution = Solution64()
        print(solution.minPathSum([[1,3,1],[1,5,1],[4,2,1]]))
    }
    
    func minPathSum(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
        
        dp[0][0] = grid[0][0]
        
        // 初始化第一列
        for i in 1..<m {
            dp[i][0] = dp[i - 1][0] + grid[i][0]
        }
        
        // 初始化第一行
        for i in 1..<n {
            dp[0][i] = dp[0][i - 1] + grid[0][i]
        }
        
        for i in 1..<m {
            for j in 1..<n {
                dp[i][j] = min(dp[i - 1][j], dp[i][j - 1]) + grid[i][j]
            }
        }
        
        return dp[m - 1][n - 1]
    }
}
