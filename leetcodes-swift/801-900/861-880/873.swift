//
//  874.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/21.
//

import Foundation

///
/// 873. 最长的斐波那契子序列的长度
///
/// 动态规划
/// dp[beginIndex][endIndex] 表示 arr[beginIndex] 到 arr[endIndex] 的最大长度
/// dp[i][j] = max(dp[k][i] + 1, dp[i][j]),  k < i < j 并且 arr[k] = a[j] - a[i]
///
class Solution873 {
    static func test() {
        let solution = Solution873()
        print(solution.lenLongestFibSubseq([1,2,3,4,5,6,7,8]))
        print(solution.lenLongestFibSubseq([1,3,7,11,12,14,18]))
    }
    
    func lenLongestFibSubseq(_ arr: [Int]) -> Int {
        let size = arr.count
        var arrMap: [Int: Int] = [:]
        for (i, v) in arr.enumerated() {
            arrMap[v] = i
        }
        
        // 两个肯定算是斐波那契数列
        var dp = Array(repeating: Array(repeating: 2, count: size), count: size)
        var res = 0
        for endIndex in 1..<size {
            for beginIndex in 0..<endIndex {
                // 和的位置
                let sum = arr[endIndex] + arr[beginIndex]
                if let index = arrMap[sum] {
                    if index > endIndex {
                        // 更新
                        dp[endIndex][index] = max(dp[endIndex][index], dp[beginIndex][endIndex] + 1)
                        res = max(res, dp[endIndex][index])
                    }
                }
            }
        }
        
        return res >= 3 ? res : 0
    }
}
