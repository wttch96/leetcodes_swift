//
//  32.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/19.
//

import Foundation

///
/// 32. 最长有效括号
///
class Solution32 {
    
    static func test() {
        let solution = Solution32()
        print(solution.longestValidParentheses("(())"))
    }
    
    func longestValidParentheses(_ s: String) -> Int {
        // 记录左括号位置
        var stack: [Int] = []
        var mark: [Bool] = Array(repeating: true, count: s.count)
        for (i, char) in s.enumerated() {
            if char == "(" {
                stack.append(i)
            } else {
                if stack.isEmpty {
                    // 不匹配的括号
                    mark[i] = false
                } else {
                    stack.removeLast()
                }
            }
        }
        // 栈中剩余的也是不匹配的
        for s in stack {
            mark[s] = false
        }
        
        // 寻找最长的 true 子队列
        var length = 0
        var maxLength = 0
        for i in 0..<s.count {
            if !mark[i] {
                length = 0
                continue
            }
            length += 1
            maxLength = max(maxLength, length)
        }
        
        return maxLength
    }
}
