//
//  22.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/18.
//

import Foundation

///
/// 22. 括号生成
///
class Solution22 {
    
    static func test() {
        let solution = Solution22()
        print(solution.generateParenthesis(3))
    }
    
    func generateParenthesis(_ n: Int) -> [String] {
        var res: [String] = []
        dfs(&res, "", 0, 0, n)
        return res
    }
    
    func dfs(_ res: inout [String], _ str: String, _ left: Int, _ right: Int, _ n: Int) {
        guard left <= n && right <= n && right <= left else {
            // 剪枝, 拼不成合适的串了
            return
        }
        if left == n && right == n {
            // 满足条件
            res.append(str)
            return
        }
        // 添加一个左括号
        dfs(&res, str + "(", left + 1, right, n)
        // 添加一个右括号
        dfs(&res, str + ")", left, right + 1, n)
    }
}
