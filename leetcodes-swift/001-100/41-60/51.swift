//
//  51.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/15.
//

import Foundation

///
/// 51. N 皇后
///
/// 记得最早学习过单数组,  即一个数组保存皇后在的 列 的值, 试试吧!
///
class Solution51 {
    
    static func test() {
        let solution = Solution51()
        print(solution.solveNQueens(4))
    }
    
    func solveNQueens(_ n: Int) -> [[String]] {
        // i 行皇后在的位置
        var res: [[String]] = []
        var queen: [Int] = Array(repeating: -1, count: n)
        solvueNQueens(n, 0, &queen, &res)
        
        return res
    }
    
    func solvueNQueens(_ n: Int, _ curRow: Int, _ queen: inout [Int], _ res: inout [[String]] ) {
        if curRow == n {
            var lines: [String] = []
            for q in queen {
                var line = ""
                for i in 0..<n {
                    line += (i == q) ? "Q" : "."
                }
                lines.append(line)
            }
            res.append(lines)
        }
        
        for tryCol in 0..<n {
            // 尝试把第 index 行皇后放在 i 列
            // 如果可行
            if !queen.contains(tryCol) {
                // 列可以
                var flag = true
                for checkRow in 0..<n {
                    // 判断斜是否可以
                    if curRow != checkRow {
                        let checkRowValue = queen[checkRow]
                        let absRow = abs(curRow - checkRow)
                        let absCol = abs(tryCol - checkRowValue)
                        if checkRowValue != -1 && absRow == absCol {
                            flag = false
                            break
                        }
                    }
                }
                if flag {
                    queen[curRow] = tryCol
                    solvueNQueens(n, curRow + 1, &queen, &res)
                    queen[curRow] = -1
                }
            }
        }
    }
}
