//
//  37.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/16.
//

import Foundation


///
/// 37. 解数独
///

class Solution37 {
    
    

    static func test() {
        let solution = Solution37.Solution()
        var problem1: [[Character]] = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
        solution.solveSudoku(&problem1)
        print(problem1)
    }
    
    class Solution {
        static let chars: [Character] = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        static let ints: [Character: Int] = ["1": 0, "2": 1, "3": 2, "4": 3, "5": 4, "6": 5, "7": 6, "8": 7, "9": 8]
        
        func solveSudoku(_ board: inout [[Character]]) {
            initBoard(board)
            solveSudoku(&board, 0)
        }
        
        
        var rows: [[Bool]]
        var cols: [[Bool]]
        var blocks: [[Bool]]
        var solved = false
        
        // 初始化三个存储空间
        init() {
            rows = Array.init(repeating: Array.init(repeating: false, count: 9), count: 9)
            cols = rows
            blocks = rows
        }
        
        func initBoard(_ board: [[Character]]) {
            // 初始化棋盘
            for r in 0..<9 {
                for c in 0..<9 {
                    guard board[r][c] != "." else {
                        continue
                    }
                    let char = Solution.ints[board[r][c]] ?? 0
                    let b = r / 3 * 3 + c / 3
                    
                    rows[r][char] = true
                    cols[c][char] = true
                    blocks[b][char] = true
                }
            }
        }
        
        func filled(_ board: inout [[Character]], _ r: Int, _ c: Int) -> Bool {
            return board[r][c] != "."
        }
        
        func tryFill(_ board: inout [[Character]], _ r: Int, _ c: Int, _ value: Int) -> Int {
            if rows[r][value] || cols[c][value]  {
                return -1
            }
            
            let b = r / 3 * 3 + c / 3
            if blocks[b][value] {
                return -1
            }
            
            board[r][c] = Solution.chars[value]
            rows[r][value] = true
            cols[c][value] = true
            blocks[b][value] = true
            
            return b
        }
        
        func backtrack(_ board: inout [[Character]], _ r: Int, _ c: Int, _ b: Int, _ value: Int) {
            board[r][c] = "."
            rows[r][value] = false
            cols[c][value] = false
            blocks[b][value] = false
        }
        
        func solveSudoku(_ board: inout [[Character]], _ n: Int) {
            if n == 81 {
                solved = true
                return
            }
            let r = n / 9
            let c = n % 9
            if filled(&board, r, c) {
                solveSudoku(&board, n + 1)
            } else {
                for num in 0..<9 {
                    // 尝试填入 num
                    let tryFill = tryFill(&board, r, c, num)
                    if tryFill != -1 {
                        solveSudoku(&board, n + 1)
                        if solved {
                            return
                        }
                        backtrack(&board, r, c, tryFill, num)
                    }
                }
            }
        }
    }
}
