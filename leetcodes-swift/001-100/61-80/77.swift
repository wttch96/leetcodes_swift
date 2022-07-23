//
//  77.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/23.
//

import Foundation

///
/// 77. 组合
///
class Solution77 {
    
    static func test() {
        let solution = Solution77()
        print(solution.combine(4, 2))
    }
    
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var res: [[Int]] = []
        var used: [Int] = []
        for i in 1...n {
            used.append(i)
        }
        combine(k, [], &used, &res)
        return res
    }
    
    func combine(_ k: Int, _ curRes: [Int], _ used: inout [Int], _ res: inout [[Int]]) {
        if curRes.count == k {
            res.append(curRes)
            return
        }
        for i in 0..<used.count {
            // 需要优化~
            let n = used[i]
            if !curRes.isEmpty && curRes.last! > n {
                continue
            }
            var tmp = curRes
            tmp.append(n)
            used.remove(at: i)
            combine(k, tmp, &used, &res)
            used.insert(n, at: i)
        }
    }
}
