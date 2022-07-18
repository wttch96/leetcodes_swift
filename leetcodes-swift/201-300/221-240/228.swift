//
//  228.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/18.
//

import Foundation

///
/// 228. 汇总区间
///
class Solution228 {
    
    static func test() {
        let solution = Solution228()
        print(solution.summaryRanges([0,1,2,4,5,7]))
    }
    
    func summaryRanges(_ nums: [Int]) -> [String] {
        var res: [String] = []
        var i = 0
        while i < nums.count {
            var j = i + 1
            // 可以二分查找么?
            while j < nums.count && nums[j] - nums[i] == j - i {
                j += 1
            }
            
            if j > i + 1 {
                res.append("\(nums[i])->\(nums[j - 1])")
            } else {
                res.append("\(nums[i])")
            }
            i = j
        }
        
        return res
    }
}
