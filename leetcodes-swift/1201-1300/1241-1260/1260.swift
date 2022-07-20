//
//  1260.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/20.
//

import Foundation

///
/// 1260. 二维网格迁移
///
class Solution1260 {
    func shiftGrid(_ grid: [[Int]], _ k: Int) -> [[Int]] {
        if grid.isEmpty {
            return []
        }
        let m = grid.count
        let n = grid[0].count
        
        var res: [[Int]] = Array(repeating: Array(repeating: -1, count: n), count: m)
        
        for i in 0..<m {
            for j in 0..<n {
                // 将元素向后移动 k 位
                let r = (i * n + j + k) % (m * n) / n
                let c = (i * n + j + k) % (m * n) % n
                res[r][c] = grid[i][j]
            }
        }
        
        return res
    }
}
