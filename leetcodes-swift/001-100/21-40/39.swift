//
//  39.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/21.
//

import Foundation

///
/// 39. 组合总和
///
class Solution39 {
    
    static func test() {
        let solution = Solution39()
        print(solution.combinationSum([100,200,4,12], 400))
    }
    
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var curRes: [Int] = []
        var res: [[Int]] = []
        let candidates = candidates.sorted()
        combination(candidates, target, 0, &curRes, &res)
        return res
    }
    
    
    ///
    ///  递归回溯调用
    /// - Parameters:
    ///   - candidates: 给定的数字集合
    ///   - target:  目标值
    ///   - n:  已经到第几个数字了，防止超时
    ///   - curRes:  当前数组
    ///   - res:  结果数组
    func combination(_ candidates: [Int], _ target: Int, _ n: Int, _ curRes: inout [Int], _ res: inout [[Int]]) {
        if target < 0 {
            return
        }
        if target == 0 {
            res.append(curRes)
            return
        }
        for i in n..<candidates.count {
            let candidate = candidates[i]
            if target >= candidate {
                // 数组拷贝更快
                let tmp = curRes
                curRes.append(candidate)
                // 已经用到第i个数字了，因为已经排过序了, 就所有小的数字该满足已经走完了, 继续看那些小的数字会导致超时
                combination(candidates, target - candidate, i, &curRes, &res)
                curRes = tmp
            } else {
                break
            }
        }
    }
}
