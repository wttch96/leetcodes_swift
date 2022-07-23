//
//  73.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/23.
//

import Foundation

///
/// 73. 矩阵置零
///
class Solution73 {
    
    func setZeroes(_ matrix: inout [[Int]]) {
        let m = matrix.count
        let n = matrix[0].count
        
        // 记录行为零的行
        var rSet = Set<Int>()
        // 记录列为零的行
        var cSet = Set<Int>()
        for r in 0..<m {
            for c in 0..<n {
                if matrix[r][c] == 0 {
                    rSet.insert(r)
                    cSet.insert(c)
                }
            }
        }
        for r in rSet {
            matrix[r] = Array(repeating: 0, count: n)
        }
        for c in cSet {
            for i in 0..<m {
                matrix[i][c] = 0
            }
        }
    }
}
