//
//  122.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/28.
//

import Foundation

///
/// 122. 买卖股票的最佳时机 II
///
class Solution122 {
    func maxProfit(_ prices: [Int]) -> Int {
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 2), count: prices.count)
        dp[0][0] = 0
        // 手里持有股票
        dp[0][1] = -prices[0]
        for i in 1..<prices.count {
            // 手里第i日持有股票: 前一天持有股票收益和前一日没有股票今日买入的最大值
            dp[i][1] = max(dp[i - 1][0] - prices[i], dp[i - 1][1])
            // 手里第i日没有股票: 前一日没有持有股票和前一日有股票今日卖出股票的最大值
            dp[i][0] = max(dp[i - 1][1] + prices[i], dp[i - 1][0])
        }
        // 最后一日卖出肯定最大
        return dp[prices.count - 1][0]
    }
}
