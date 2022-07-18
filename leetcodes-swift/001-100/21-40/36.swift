//
//  36.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/15.
//

///
/// 36. 有效的数独
///
import Foundation

class Solution36 {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rows: [[Bool]] = Array.init(repeating: Array.init(repeating: false, count: 9), count: 9)
        var cols: [[Bool]] = rows
        var blocks: [[Bool]] = rows

        for r in 0..<9 {
            for c in 0..<9 {
                guard board[r][c] != "." else {
                    continue
                }
                let char = Int(board[r][c].asciiValue ?? 0)  - 49
                if rows[r][char] || cols[c][char] {
                    return false
                }
                
                let b = r / 3 * 3 + c / 3
                if blocks[b][char] {
                    return false
                }
                
                rows[r][char] = true
                cols[c][char] = true
                blocks[b][char] = true
            }
        }
        
        return true
    }
}
