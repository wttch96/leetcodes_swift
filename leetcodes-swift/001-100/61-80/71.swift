//
//  71.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/23.
//

import Foundation

///
/// 71. 简化路径
///
class Solution71 {
    
    static func test() {
        let solution = Solution71()
        assert(solution.simplifyPath("/home//foo/") == "/home/foo")
        assert(solution.simplifyPath("/a/./b/../../c/") == "/c")
    }
    
    func simplifyPath(_ path: String) -> String {
        let paths = path.split(separator: "/")
        var stack: [String] = []
        for p in paths {
            if p == ".." {
                if !stack.isEmpty {
                    // .. 上退一层
                    stack.removeLast()
                }
            } else if !p.isEmpty && p != "." {
                // 不为空并且不为 "." 添加到栈后
                stack.append(String(p))
            }
        }
        // 重新拼装
        return "/" + stack.joined(separator: "/")
    }
}
