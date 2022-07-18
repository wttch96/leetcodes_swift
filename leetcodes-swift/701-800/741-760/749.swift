//
//  749.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/18.
//

import Foundation

///
/// 749. 隔离病毒
///
class Solution749 {
    
    static func test() {
        let solution = Solution749()
        solution.containVirus([[0,1,0,0,0,0,0,1],[0,1,0,0,0,0,0,1],[0,0,0,0,0,0,0,1],[0,0,0,0,0,0,0,0]])
    }
    
    // 格子
    var gard: [[Int]] = []
    var towards: [[Int]] = [[0, -1], [0, 1], [-1, 0], [1, 0]]
    // size
    var m = 0
    var n = 0
    
    let INFETED = 1
    let OPEN = 0
    let LOCKED = -1
    
    func containVirus(_ isInfected: [[Int]]) -> Int {
        gard = isInfected
        m = isInfected.count
        n = isInfected[0].count
        
        print(findMaxThreat())
        
        return 0
    }
    
    // 查找最大威胁, 封锁并记录需要的防火墙个数
    func findMaxThreat() -> [[Int]] {
        var visit = Array(repeating: Array(repeating: false, count: n), count: m)
        var maxThreat = 0
        var maxPos: [[Int]] = []
        for i in 0..<m {
            for j in 0..<n {
                var pos: [[Int]] = []
                let findThreat = dfsFind(i, j, &visit, &pos)
                if findThreat > maxThreat {
                    maxThreat = findThreat
                    maxPos = pos
                }
            }
        }
        return maxPos
    }
    
    // 深度优先查找
    func dfsFind(_ r: Int, _ c: Int, _ visit: inout [[Bool]], _ pos: inout [[Int]]) -> Int {
        guard r >= 0 && r < m && c >= 0 && c < n && !visit[r][c] else {
            // 出界威胁是 0
            return 0
        }
        
        if gard[r][c] == OPEN {
            return 1
        }
        
        var count = 0
        
        if gard[r][c] == INFETED {
            visit[r][c] = true
            pos.append([r, c])
            for toward in towards {
                count += dfsFind(r + toward[0], c + toward[1], &visit, &pos)
            }
        }
        
        return count
    }
}
