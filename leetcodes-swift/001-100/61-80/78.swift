//
//  78.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/24.
//

import Foundation

///
/// 78. 子集
///
class Solution78 {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []
        var used = Array(repeating: false, count: nums.count)
        
        subsets([], nums, &used, &res)
        
        return res
    }
    
    func subsets(_ curPath: [Int], _ nums: [Int], _ used: inout [Bool], _ res: inout [[Int]]) {
        if nums.isEmpty {
            // 用完了
            res.append(curPath)
            return
        }
        
        // 啥都不选
        res.append(curPath)
        
        for (i, num) in nums.enumerated() {
            if !used[i] {
                // 跳过一些防止重复
                if !curPath.isEmpty && curPath.last! > num {
                    continue
                }
                used[i] = true
                var tmp = curPath
                tmp.append(num)
                subsets(tmp, nums, &used, &res)
                used[i] = false
            }
        }
    }
}
