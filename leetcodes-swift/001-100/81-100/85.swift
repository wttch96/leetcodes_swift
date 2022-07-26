//
//  85.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/26.
//

import Foundation

///
/// 85. 最大矩形
///
/// 可以将每一行看成上面所有连续个1的柱子, 然后和题目 84 一样使用单调栈
///
class Solution85 {
    
    static func test() {
        let solution = Solution85()
        print(solution.maximalRectangle([["1","0","1","0","0"], ["1","0","1","1","1"], ["1","1","1","1","1"], ["1","0","0","1","0"]]))
    }
    
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        let m = matrix.count
        let n = matrix[0].count
        // 每行在改行上面的柱子高度
        var heightMatrix = Array(repeating: Array(repeating: 0, count: n), count: m)
        for i in 0..<m {
            for j in 0..<n {
                if matrix[i][j] == "1" {
                    // 将数据向下求连续
                    heightMatrix[i][j] = (i == 0 ? 0 : heightMatrix[i - 1][j]) + 1
                }
            }
        }
        
        var res = 0
        
        for heights in heightMatrix {
            guard heights.count != 1 else {
                res = max(res, heights[0])
                continue
            }
            
            // 分别对每一行使用单调栈
            var left = Array(repeating: 0, count: heights.count)
            var right = Array(repeating: heights.count, count: heights.count)
            var stack: [Int] = []
            for (i, h) in heights.enumerated() {
                while !stack.isEmpty && heights[stack.last!] >= h {
                    // 当前元素不高于该元素的最右侧位置
                    right[stack.last!] = i
                    stack.removeLast()
                }
                // 当前元素不高于该元素的最左侧位置
                left[i] = stack.isEmpty ? -1 : stack.last!
                stack.append(i)
            }
            
            for (i, h) in heights.enumerated() {
                res = max(res, (right[i] - 1 - left[i]) * h)
            }
        }
        
        return res
    }
}
