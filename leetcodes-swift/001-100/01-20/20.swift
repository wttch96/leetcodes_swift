//
//  20.swift
//  letcode
//
//  Created by Wttch on 2022/7/6.
//

import Foundation

///
/// 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。
///
/// 有效字符串需满足：
/// 左括号必须用相同类型的右括号闭合。
/// 左括号必须以正确的顺序闭合。
///
public class Solution20 {
    
    public init() {
        
    }
    
    ///
    /// 简单的栈问题
    ///
    public func isValid(_ s: String) -> Bool {
        var stack: [Character] = []
        for c in s {
            // 空的入栈
            if stack.isEmpty {
                stack.append(c)
                continue
            }
            // 比较栈顶元素和要入的元素是否配对
            let endC = stack[stack.endIndex - 1]
            if endC == "(" && c == ")" || endC == "[" && c == "]" || endC == "{" && c == "}" {
                // 配对移除
                stack.removeLast()
            } else {
                // 不配对入栈
                stack.append(c)
            }
        }
        // 空就是全匹配
        return stack.isEmpty
    }
}
