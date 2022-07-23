//
//  80.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/23.
//

import Foundation


///
/// 80. 删除有序数组中的重复项 II
///
class Solution80 {
    
    static func test() {
        let solution = Solution80()
        var case1 = [1,1,1,2,2,3]
        print(solution.removeDuplicates(&case1))
        print(case1)
    }
    
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var i = 0
        for num in nums {
            // 前俩数字不用管, 然后后面数字比前面两个数大就扔到 i 的位置
            if i < 2 || num > nums[i - 2] {
                nums[i] = num
                i += 1
            }
        }
        return i
    }
}
