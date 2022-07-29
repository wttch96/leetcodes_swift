//
//  123.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/29.
//

import Foundation

///
/// 123. 买卖股票的最佳时机 III
///
class Solution123 {
    func maxProfit(_ prices: [Int]) -> Int {
        let size = prices.count
        var buy1 = -prices[0], sell1 = 0, buy2 = -prices[0], sell2 = 0
        
        for i in 1..<size {
            // 买第一支股票的收益
            buy1 = max(buy1, -prices[i])
            // 卖出第一支股票的收益
            sell1 = max(sell1, buy1 + prices[i])
            // 买入第二支股票的收益
            buy2 = max(buy2, sell1 - prices[i])
            // 卖出第二支股票的收益
            sell2 = max(sell2, buy2 + prices[i])
            print(buy1, sell1, buy2, sell2)
        }
        
        return sell2
    }
}
