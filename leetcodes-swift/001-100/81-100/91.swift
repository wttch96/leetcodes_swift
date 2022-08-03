//
//  91.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/8/2.
//

import Foundation

///
/// 91. 解码方法
///
class Solution91 {

    static func test() {
        let solution = Solution91()
        assert(solution.numDecodings("12") == 2)
        assert(solution.numDecodings("226") == 3)
        assert(solution.numDecodings("0") == 0)
        assert(solution.numDecodings("111111111111111111111111111111111111111111111") == 1836311903)
    }
    
    func numDecodings(_ s: String) -> Int {
        if s.first == "0" { return 0 }
        let ints: [Int] = s.map({ Int($0.asciiValue!) - 48 })
        var dp = Array(repeating: 0, count: ints.count + 1)
        dp[0] = 1
        for i in 1..<dp.count {
            if ints[i - 1] != 0 {
                // 单个数字
                dp[i] += dp[i - 1]
            }
            if i > 1 && ints[i - 2] != 0 && ints[i - 2] * 10 + ints[i - 1] <= 26 {
                // 两个数字要保证小于 26
                dp[i] += dp[i - 2]
            }
        }
        
        return dp[s.count]
    }
}
