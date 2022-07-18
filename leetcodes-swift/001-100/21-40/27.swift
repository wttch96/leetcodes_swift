//
//  27.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/7.
//

import Foundation


///
/// 27. 移除元素
///
public class Solution27 {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        if nums.isEmpty {
            return 0
        }
        
        var count = 0
        var offset = 0
        for i in 0 ..< nums.count {
            if nums[i] == val {
                // 一致
                offset += 1
                continue
            } else {
                // 不一致
                nums[i - offset] = nums[i]
                count += 1
            }
        }
        return count
    }
}
