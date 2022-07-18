//
//  70.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/12.
//

import Foundation

///
/// 70. 爬楼梯
///
/// 动态规划? 感觉像是斐波那契数列, 或者公式也可以
///
class Solution70 {
    
    static func test() {
        let solution = Solution70()
        print(solution.climbStairs(45))
    }
    
    func climbStairs(_ n: Int) -> Int {
        if n <= 3 {
            return n
        }
        var dp1 = 1
        var dp2 = 2
        for _ in 3...n {
            let tmp = dp1 + dp2
            dp1 = dp2
            dp2 = tmp
        }
        
        return dp2
    }
}
