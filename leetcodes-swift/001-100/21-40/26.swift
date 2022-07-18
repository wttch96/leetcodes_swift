//
//  26.swift
//  letcode
//
//  Created by Wttch on 2022/7/7.
//

import Foundation

///
/// 26. 删除有序数组中的重复项
///
public class Solution26 {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        
        var curNum = nums[0]
        var count = 1
        var offset = 0
        for i in 1 ..< nums.count {
            if nums[i] == curNum {
                // 一致
                offset += 1
                continue
            } else {
                // 不一致
                nums[i - offset] = nums[i]
                curNum = nums[i]
                count += 1
            }
        }
        return count
    }
}
