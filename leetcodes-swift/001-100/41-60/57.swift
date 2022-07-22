//
//  57.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/22.
//

import Foundation

///
/// 57. 插入区间
///
class Solution57 {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var nums = intervals
        nums.append(newInterval)
        
        nums = nums.sorted { a, b in
            // 找最小的左区间
            return a[0] < b[0]
        }
        var res: [[Int]] = []
        var coverL = nums[0][0]
        var coverR = nums[0][1]
        for i in 1..<nums.count {
            let l = nums[i][0]
            let r = nums[i][1]
            if l >= coverR + 1 {
                // 不相交
                res.append([coverL, coverR])
                coverL = l
                coverR = r
            } else {
                // 扩展区间
                coverL = min(coverL, l)
                coverR = max(coverR, r)
            }
        }
        res.append([coverL, coverR])
        
        return res
    }
}
