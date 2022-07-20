//
//  1252.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/12.
//

import Foundation


///
/// 1252. 奇数值单元格的数目
///
class Solution1252 {
    
    static func test() {
        let solution = Solution1252()
        print(solution.oddCells(2, 3, [[0,1], [1, 1]]))
    }
    
    func oddCells(_ m: Int, _ n: Int, _ indices: [[Int]]) -> Int {
        var rows = Array(repeating: false, count: m)
        var cols = Array(repeating: false, count: n)
        for index in indices {
            rows[index[0]] = !rows[index[0]]
            cols[index[1]] = !cols[index[1]]
        }
        let rCount = rows.filter({$0}).count
        let cCount = cols.filter({$0}).count
        
        return rCount * (n - cCount)  + cCount * (m - rCount)
    }
}
