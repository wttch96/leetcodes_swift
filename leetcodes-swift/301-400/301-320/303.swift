//
//  303.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/27.
//

import Foundation

///
/// 303. 区域和检索 - 数组不可变
///
class NumArray {
    // 求前n项和
    private var sums: [Int]

    init(_ nums: [Int]) {
        sums = Array(repeating: 0, count: nums.count)
        sums[0] = nums[0]
        for i in 1..<nums.count {
            sums[i] = sums[i - 1] + nums[i]
        }
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        if left < 1 {
            return sums[right]
        }
        return sums[right] - sums[left - 1]
    }
}
