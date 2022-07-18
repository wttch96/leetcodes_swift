//
//  565.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/17.
//

import Foundation

///
/// 565. 数组嵌套
///
class Solution565 {
    
    static func test() {
        let solution = Solution565()
        print(solution.arrayNesting([5,4,0,3,1,6,2]))
    }
    
    func arrayNesting(_ nums: [Int]) -> Int {
        var length = Array(repeating: -1, count: nums.count)
        var res = 0
        for i in 0..<nums.count {
            res = max(res, dfs(nums, &length, i))
        }
        return res
    }
    
    // 深度优先, 统计长度
    func dfs(_ nums: [Int], _ length: inout [Int], _ index: Int) -> Int {
        // 已经计算过
        if length[index] != -1 {
            return length[index]
        }
        // 当前元素的长度置为0
        length[index] = 0
        // 深度优先计算
        length[index] = 1 + dfs(nums, &length, nums[index])
        return length[index]
    }
}
