//
//  56.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/22.
//

import Foundation

///
/// 56. 合并区间
///
class Solution56 {
    
    static func test() {
        let solution = Solution56()
        print(solution.merge([[1,4],[5,6]]))
        print(solution.merge([[2,3],[4,5],[6,7],[8,9],[1,10]]))
        print(solution.merge([[1,3],[2,6],[8,10],[15,18]]))
    }
    
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        if intervals.count <= 1 {
            return intervals
        }
        
        let nums = intervals.sorted { a, b in
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
