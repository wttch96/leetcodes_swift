//
//  74.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/23.
//

import Foundation

///
/// 74. 搜索二维矩阵
///
class Solution74 {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let m = matrix.count
        let n = matrix[0].count
        var r = 0
        var c = 0

        // 特殊情况
        if m == 1 && n == 1 { return matrix[0][0] == target }
        
        while r < m && c < n {
            if matrix[r][c] == target {
                return true
            }
            let newR = r + 1
            if newR < m {
                if matrix[newR][c] <= target {
                    // 往下还小
                    r = newR
                    continue
                }
            }
            let newC = c + 1
            if newC < n {
                // 小于下面大于右面
                if matrix[r][newC] <= target {
                    c = newC
                    continue
                }
            }
            return false
        }
        
        return false
    }
}
