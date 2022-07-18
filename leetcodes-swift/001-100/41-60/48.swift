//
//  48.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/16.
//

import Foundation

///
/// 48. 旋转图像
///
class Solution48 {
    func rotate(_ matrix: inout [[Int]]) {
        // 转4个三角形:
        // 第0行 0 到 n-2
        // 第1行 1 到 n-4
        // 奇数: (n-1)/2 行
        // 偶数: n/2     行
        let size = matrix.count
        let n = (size - size % 2) / 2
        for i in 0..<n {
            for j in i...(size - 2 - i) {
                // 四个元素互换
                // 第一个元素位置 i,j
                // 第二个元素位置 j, size - 1 - i
                // 第三个元素位置 size - 1 - i, size - 1 - j
                // 第四个元素位置 size - 1 - j, i
                // 4 <== 3 <== 2 <== 1
                let t = matrix[size - 1 - j][i]
                matrix[size - 1 - j][i] = matrix[size - 1 - i][size - 1 - j]
                matrix[size - 1 - i][size - 1 - j] = matrix[j][size - 1 - i]
                matrix[j][size - 1 - i] = matrix[i][j]
                matrix[i][j] = t
            }
        }
    }
}
