//
//  52.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/15.
//

import Foundation


///
/// 52. N 皇后 II
///
///
class Solution52 {
    
    static func test() {
        let solution = Solution52()
        print(solution.totalNQueens(4))
    }
    
    func totalNQueens(_ n: Int) -> Int {
        // i 行皇后在的位置
        var res: Int = 0
        var queen: [Int] = Array(repeating: -1, count: n)
        solvueNQueens(n, 0, &queen, &res)
        
        return res
    }
    
    func solvueNQueens(_ n: Int, _ curRow: Int, _ queen: inout [Int], _ res: inout Int ) {
        if curRow == n {
            res += 1
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
                    // 回溯
                    queen[curRow] = -1
                }
            }
        }
    }
}
