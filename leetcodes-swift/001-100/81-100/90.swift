//
//  90.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/25.
//

import Foundation

///
/// 90. 子集 II
///
class Solution90 {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []
        // 排序, 防止数据重复使用
        let sortedNums = nums.sorted()
        var used = Array(repeating: false, count: nums.count)
        
        subsets([], sortedNums, &used, &res)
        
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
                // 如果前一个数据一样并且没有用过, 跳过
                if i > 0 && nums[i - 1] == num && !used[i - 1] {
                    continue
                }
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
