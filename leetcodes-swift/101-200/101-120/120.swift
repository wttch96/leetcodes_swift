//
//  120.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/25.
//

import Foundation

///
/// 120. 三角形最小路径和
///
class Solution120 {
    
    static func test() {
        let solution = Solution120()
        // print(solution.minimumTotal([[2],[3,4],[6,5,7],[4,1,8,3]]))
        print(solution.minimumTotal([[-10]]))
    }
    
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        // 特殊处理
        if triangle.count == 1 { return triangle[0][0] }
        
        let size = triangle.count
        var dp: [[Int]] = Array(repeating: [], count: size)
        var res = Int.max
        for (i, line) in triangle.enumerated() {
            if i > 0 {
                let cnt = line.count
                dp[i] = Array(repeating: 0, count: cnt)
                for j in 0..<cnt {
                    // 计算 dp
                    // 1: j == 0, dp[i - 1][0]
                    // 2: j == cnt - 1, dp[i - 1][i - 1]
                    // 3: dp = min(dp[i - 1][j - 1], dp[i - 1][j]
                    dp[i][j] = line[j] + ((j == 0) ? dp[i - 1][0] : (j == cnt - 1) ? dp[i - 1][i - 1] : min(dp[i - 1][j - 1], dp[i - 1][j]))
                    if i == size - 1 {
                        res = min(res, dp[i][j])
                    }
                }
            } else {
                dp[i] = line
            }
        }
        return res
    }
}
