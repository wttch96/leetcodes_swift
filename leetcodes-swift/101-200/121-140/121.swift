//
//  121.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/13.
//

import Foundation

///
/// 121. 买卖股票的最佳时机
///
class Solution121 {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count <= 1 {
            // 1 天无法做到有收益
            return 0
        }
        var profit = 0
        var minPrice = prices[0]
        for i in 1..<prices.count {
            // 第 i 天收益 = max(前 i-1 天最大收益, 第 i 天 - 前 i 天最小价格)
            profit = max(profit, prices[i] - minPrice)
            minPrice = min(prices[i], minPrice)
        }
        return profit
    }
}
