//
//  84.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/25.
//

import Foundation

///
/// 84. 柱状图中最大的矩形
///
/// 单调栈
///
class Solution84 {
    
    static func test() {
        let solution = Solution84()
        assert(solution.largestRectangleArea([2,1,2]) == 3)
        assert(solution.largestRectangleArea([5,4,1,2]) == 8)
        assert(solution.largestRectangleArea([2,1,5,6,2,3]) == 10)
        assert(solution.largestRectangleArea([2, 4]) == 4)
        assert(solution.largestRectangleArea([4,2,0,3,2,5]) == 6)
    }
    
    
    func largestRectangleArea(_ heights: [Int]) -> Int {
        if heights.count == 1 { return heights[0] }
        
        var stack: [Int] = []
        var left: [Int] = Array(repeating: 0, count: heights.count)
        var right: [Int] = Array(repeating: heights.count, count: heights.count)
        
        for (i, v) in heights.enumerated() {
            while !stack.isEmpty && heights[stack.last!] >= v {
                // 弹出说明他的右侧已经出现了
                right[stack.last!] = i
                stack.removeLast()
            }
            // 现在栈顶的是他的左边界
            left[i] = stack.isEmpty ? -1 : stack.last!
            stack.append(i)
        }
        
        var res = 0
        for i in 0..<heights.count {
            res = max(res, (right[i] - 1 - left[i]) * heights[i])
        }
    
        return res
    }
}
