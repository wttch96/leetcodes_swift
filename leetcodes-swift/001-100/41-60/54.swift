//
//  54.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/21.
//

import Foundation

///
/// 54. 螺旋矩阵
///
class Solution54 {
    
    static func test() {
        let solution = Solution54()
        print(solution.spiralOrder([[1,2,3],[4,5,6],[7,8,9]]))
    }
    
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        if matrix.isEmpty {
            return []
        }
        // 上下左右走到了几层
        var top = 0
        var left = 0
        var right = 0
        var bottom = 0
        var i = 0
        var res: [Int] = []
        let m = matrix.count
        let n = matrix[0].count
        while i < m * n {
            if i < m * n {
                for j in left..<(n - right) {
                    res.append(matrix[top][j])
                    i += 1
                }
            }
            top += 1
            if i < m * n {
                for j in top..<(m - bottom) {
                    res.append(matrix[j][n - 1 - right])
                    i += 1
                }
            }
            right += 1
            if i < m * n {
                for j in right..<(n - left) {
                    res.append(matrix[m - 1 - bottom][n - 1 - j])
                    i += 1
                }
            }
            bottom += 1
            if i < m * n {
                for j in bottom..<(m - top) {
                    res.append(matrix[m - 1 - j][left])
                    i += 1
                }
            }
            left += 1
        }
        return res
    }
}
