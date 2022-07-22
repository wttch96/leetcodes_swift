//
//  60.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/22.
//

import Foundation

///
/// 60. 排列序列
///
/// 康托展开: 𝑋=𝑎[𝑛]∗(𝑛−1)!+𝑎[𝑛−1]∗(𝑛−2)!+...+𝑎[𝑖]∗(𝑖−1)!+...+𝑎[1]∗0!
///
/// 逆康托展开:
///
class Solution60 {
    
    static func test() {
        let solution = Solution60()
        print(solution.getPermutation(5, 62))
    }
    
    func getPermutation(_ n: Int, _ k: Int) -> String {
        guard n > 1 else {
            return "1"
        }
        var index = k - 1
        var fac: [Int] = [1, 1]
        for i in 2..<n {
            fac.append(fac[i - 1] * i)
        }
        var res = ""
        var used:[Bool] = Array(repeating: false, count: n)
        
        for i in (1..<n).reversed() {
            let num = index / fac[i]
            let tmp = findNum(&used, num + 1)
            // 第 i 位后面 比 i 小的有 num 个
            res.append("\(tmp)")
            index %= fac[i]
        }
        res.append("\(findNum(&used, 1))")
        
        return res
    }
    
    func findNum(_ used: inout [Bool], _ n: Int) -> Int {
        var cnt = 0
        for (i, v) in used.enumerated() {
            if !v {
                cnt += 1
            }
            if cnt == n {
                used[i] = true
                return i + 1
            }
        }
        return 0
    }
}
