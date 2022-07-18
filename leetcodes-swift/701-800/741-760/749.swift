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
/// 深度优先遍历
///
class Solution749 {
    
    static func test() {
        let solution = Solution749()
        print(solution.containVirus([
            [0,1,0,1,0,1,1,0,1,0],
            [0,1,1,1,1,0,0,0,1,1],
            [1,0,1,1,1,1,1,1,1,0],
            [1,1,1,1,1,1,1,1,1,0],
            [1,0,1,1,1,1,1,1,1,1],
            [0,0,1,0,0,1,1,0,1,1],
            [1,1,0,1,0,0,0,1,1,1],
            [1,1,1,1,1,0,1,1,1,1],
            [0,1,0,1,1,1,1,1,1,1],
            [0,0,1,1,1,1,0,1,1,1]]))
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
        
        var res = 0
        var spreadCount = 0
        repeat {
            // 墙圈起来的位置
            var lockedPos: [[Int]] = []
            // 找到最大威胁需要的墙的数量
            let wallCount = findMaxThreat(&lockedPos)
            if !lockedPos.isEmpty {
                res += wallCount
                for pos in lockedPos {
                    gard[pos[0]][pos[1]] = LOCKED
                }
            }
            spreadCount = spread()
        } while spreadCount != 0
        
        return res
    }
    
    // 扩散
    func spread() -> Int {
        var spreads: [[Int]] = []
        for i in 0..<m {
            for j in 0..<n {
                if gard[i][j] == INFETED {
                    for toward in towards {
                        let r = i + toward[0]
                        let c = j + toward[1]
                        if r >= 0 && r < m && c >= 0 && c < n && gard[r][c] == OPEN {
                            spreads.append([r, c])
                        }
                    }
                }
            }
        }
        for spread in spreads {
            gard[spread[0]][spread[1]] = INFETED
        }
        
        return spreads.count
    }
    
    // 查找最大威胁, 记录需要的防火墙个数
    func findMaxThreat(_ lockedPos: inout [[Int]]) -> Int {
        var visit = Array(repeating: Array(repeating: false, count: n), count: m)
        // 最大威胁
        var maxThreat = 0
        // 墙的数量
        var wallCount = 0
        for i in 0..<m {
            for j in 0..<n {
                // 最大威胁会圈起来的位置
                var maxThreatLockPos: [[Int]] = []
                // 最大威胁
                var threatPos:Set<[Int]> = Set()
                // dfs 遍历
                let wc = dfsFind(i, j, &visit, &maxThreatLockPos, &threatPos, false)
                // 最大威胁数量
                let findThreat = threatPos.count
                if findThreat > maxThreat {
                    maxThreat = findThreat
                    lockedPos = maxThreatLockPos
                    wallCount = wc
                }
            }
        }
        return wallCount
    }
    
    // 深度优先查找
    func dfsFind(_ r: Int, _ c: Int, _ visit: inout [[Bool]], _ pos: inout [[Int]], _ threatPos: inout Set<[Int]>, _ nearVirrus: Bool) -> Int {
        guard r >= 0 && r < m && c >= 0 && c < n && !visit[r][c] else {
            // 出界墙是 0
            return 0
        }
        
        if gard[r][c] == OPEN && nearVirrus {
            threatPos.insert([r, c])
            // 靠近病毒, 墙是1
            return 1
        }
        var count = 0
        if gard[r][c] == INFETED {
            visit[r][c] = true
            // 有威胁的位置
            pos.append([r, c])
            for toward in towards {
                // 墙的数量
                count += dfsFind(r + toward[0], c + toward[1], &visit, &pos, &threatPos, true)
            }
        }
        
        return count
    }
}
