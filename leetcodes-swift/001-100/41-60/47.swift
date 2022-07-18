//
//  47.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/7.
//

import Foundation


///
/// 47. 全排列（包含重复数字）
///
public class Solution47 {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        var used: [Bool] = Array(repeating: false, count: nums.count)
        var path: [Int] = []
        var newNums = Array(nums)
        // 排序
        newNums.sort()
        dfs(&path, newNums, &result, &used)
        
        return result
    }
    
    func dfs(_ path: inout [Int], _ nums: [Int], _ result: inout [[Int]], _ used: inout [Bool]) {
        if path.count == nums.count {
            // 满足
            // struct 传递时候是值传递
            result.append(path)
            return
        }
        for i in 0 ..< nums.count {
            // 如果重复的值前一个还没用过，后一个就不能再用
            if i > 0 && nums[i] == nums[i - 1] && !used[i - 1] {
                continue
            }
            if !used[i] {
                path.append(nums[i])
                used[i] = true
                
                dfs(&path, nums, &result, &used)
                
                path.removeLast()
                used[i] = false
            }
        }
        
    }
    
    static func test() {
        let solution = Solution47()
        print(solution.permuteUnique([1, 1, 3, 4]))
    }
}
