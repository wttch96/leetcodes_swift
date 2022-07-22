//
//  62.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/22.
//

import Foundation

///
/// 62. 不同路径
///
/// 从 m + n - 2 中选 m - 1 向下走
/// 即 C(m + n - 2, m - 1)
///
class Solution62 {
    
    static func test() {
        print(Solution62().uniquePaths(13, 23))
    }
    
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        if m == 1 || n == 1 {
            return 1
        }
        return C(m + n - 2, m - 1)
    }
    
    func C(_ m: Int, _ n: Int) -> Int {
        var mul: [Int] = []
        var fac: [Int] = []
        for i in 1...(m - n) {
            fac.append(i)
        }
        for i in n+1...m {
            mul.append(i)
        }
        
        for i in 0..<mul.count {
            for j in 0..<fac.count {
                if mul[i] % fac[j] == 0 {
                    // 简单优化下防止溢出
                    mul[i] = mul[i] / fac[j]
                    fac[j] = 1
                }
            }
        }
        
        return mul.reduce(1) { $0 * $1 } / fac.reduce(1) { $0 * $1}
    }
}
