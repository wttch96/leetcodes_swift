//
//  593.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/29.
//

import Foundation

///
/// 593. 有效的正方形
///
class Solution593 {
    func validSquare(_ p1: [Int], _ p2: [Int], _ p3: [Int], _ p4: [Int]) -> Bool {
        var set = Set<Int>()
        set.insert(lengthSquare(p1, p2))
        set.insert(lengthSquare(p1, p3))
        set.insert(lengthSquare(p1, p4))
        set.insert(lengthSquare(p3, p2))
        set.insert(lengthSquare(p4, p2))
        set.insert(lengthSquare(p3, p4))
        let res = set.sorted()
        return set.count == 2 && res[0] * 2 == res[1]
    }
    
    func lengthSquare(_ p1: [Int], _ p2: [Int]) -> Int {
        let dtX = p1[0] - p2[0]
        let dtY = p1[1] - p2[1]
        return dtX * dtX + dtY * dtY
    }
}
