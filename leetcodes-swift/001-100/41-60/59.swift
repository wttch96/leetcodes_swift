//
//  59.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/22.
//

import Foundation

///
/// 59. 螺旋矩阵 II
///
class Solution59 {
    
    static func test() {
        let solution = Solution59()
        print(solution.generateMatrix(1))
    }
    
    func generateMatrix(_ n: Int) -> [[Int]] {
        var res = Array(repeating: Array(repeating: 0, count: n), count: n)
        // 朝向
        let towards = [[0, 1], [1, 0], [0, -1], [-1, 0]]
        // 当前行列
        var r = 0
        var c = 0
        // 当前朝向
        var towardIndex = 0
        res[0][0] = 1
        if n == 1 {
            // 1 结束
            return res
        }
        for i in 2...n*n {
            var toward = towards[towardIndex]
            let newR = r + toward[0]
            let newC = c + toward[1]
            if  newR < 0 || newR >= n || newC < 0 || newC >= n || res[newR][newC] != 0 {
                // 换向
                towardIndex = (towardIndex == 3) ? 0 : (towardIndex + 1)
            }
            toward = towards[towardIndex]
            // 移动,赋值
            r = r + toward[0]
            c = c + toward[1]
            res[r][c] = i
        }
        
        return res
    }
}
