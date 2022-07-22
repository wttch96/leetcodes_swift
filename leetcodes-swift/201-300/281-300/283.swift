//
//  283.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/23.
//

import Foundation

///
/// 283. 移动零
///
class Solution283 {
    func moveZeroes(_ nums: inout [Int]) {
        var index = 0
        for i in 0..<nums.count {
            if nums[i] != 0 {
                // 不是0就往前面放
                nums[index] = nums[i]
                index += 1
            }
        }
        while index < nums.count {
            // 后面补0
            nums[index] = 0
            index += 1
        }
    }
}
