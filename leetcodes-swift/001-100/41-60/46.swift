//
//  46.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/7.
//

import Foundation


///
/// 46. 全排列
///
public class Solution46 {
    func permute(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        var used: [Bool] = Array(repeating: false, count: nums.count)
        var path: [Int] = []
        dfs(&path, nums, &result, &used)
        
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
            if !used[i] {
                path.append(nums[i])
                used[i] = true
                
                dfs(&path, nums, &result, &used)
                
                path.popLast()
                used[i] = false
            }
        }
        
    }
    
    static func test() {
        let solution = Solution46()
        print(solution.permute([1, 2, 3, 4]))
    }
}
