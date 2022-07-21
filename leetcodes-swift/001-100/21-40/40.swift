//
//  40.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/21.
//

import Foundation
///
/// 39. 组合总和 II
///
class Solution40 {
    
    static func test() {
        let solution = Solution40()
        print(solution.combinationSum2([10,1,2,7,6,1,5], 8))
    }
    
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var curRes: [Int] = []
        var res: [[Int]] = []
        var candidates = candidates.sorted()
        combination(&candidates, target, 0, &curRes, &res)
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
    func combination(_ candidates: inout [Int], _ target: Int, _ n: Int, _ curRes: inout [Int], _ res: inout [[Int]]) {
        if target < 0 {
            return
        }
        if target == 0 {
            res.append(curRes)
            return
        }
        for i in n..<candidates.count {
            // 防止重复
            if i > n && candidates[i] == candidates[i-1] {
                continue
            }
            let candidate = candidates[i]
            if target >= candidate {
                // 数组拷贝更快
                let tmp = curRes
                // 记录使用的数字
                curRes.append(candidate)
                // 移除已经使用的
                candidates.remove(at: i)
                // 已经用到第i个数字了，因为已经排过序了, 就所有小的数字该满足已经走完了, 继续看那些小的数字会导致超时
                combination(&candidates, target - candidate, i, &curRes, &res)
                // 回溯
                candidates.insert(candidate, at: i)
                curRes = tmp
            } else {
                break
            }
        }
    }
}
