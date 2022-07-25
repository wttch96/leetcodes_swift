//
//  79.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/25.
//

import Foundation

///
/// 79. 单词搜索
///
/// 可以用空间换时间, 先这样了
/// 执行用时：864 ms, 在所有 Swift 提交中击败了48.62%的用户
/// 内存消耗：13.9 MB, 在所有 Swift 提交中击败了82.57%的用户
///
class Solution79 {
    
    static func test() {
        let solution = Solution79()
        assert(solution.exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCCED"))
        assert(solution.exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "SEE"))
        assert(!solution.exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCB"))
        assert(solution.exist([["C","A","A"],["A","A","A"],["B","C","D"]], "AAB"))
    }
    
    func printBoard(_ board: [[Character]]) {
        print(board.reduce("", { r, line in
            var tmp: String = r
            tmp += (line.reduce("", { r, c in
                var t: String = r
                t.append(c)
                return t
            }))
            tmp.append("\n")
            return tmp
        }))
    }
    
    // 高/宽
    private var m = 0
    private var n = 0
    // 棋盘
    private var board: [[Character]] = []
    // 剩余未匹配的字符
    private var chars: [Character] = []
    
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        m = board.count
        n = board[0].count
        // 长度不够, 直接结束
        guard m * n >= word.count else { return false }
        self.board = board
        
        chars = word.map({ $0 }).reversed()
        
        for i in 0..<m {
            for j in 0..<n {
                if board[i][j] == chars.last {
                    // 算是入口
                    if dfs(i, j) {
                        return true
                    }
                }
            }
        }
        
        return false
    }
    
    func dfs(_ r: Int, _ c: Int) -> Bool {
        // 全部找到了
        if chars.isEmpty { return true }
        
        if canMove(r, c) && board[r][c] == chars.last {
            // 标记已经走过
            board[r][c] = "."
            // printBoard(board)
            // 删除匹配的字母
            let char: Character = chars.popLast()!
            // 向其他方向移动
            for toward in towards {
                if dfs(r + toward[0], c + toward[1]) {
                    return true
                }
            }
            // 回溯
            board[r][c] = char
            chars.append(char)
        }
        
        return false
    }
    // 是否可以移动
    func canMove(_ r: Int, _ c: Int) -> Bool {
        return r >= 0 && r < m && c >= 0 && c < n && board[r][c] != "."
    }
    // 朝向
    let towards = [[0, 1], [0, -1], [1, 0], [-1, 0]]
}
