//
//  48.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/7.
//

import Foundation


///
/// 35. 搜索插入位置
///
public class Solution35 {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        if nums.isEmpty {
            return 0
        }
        
        var left = 0
        var right = nums.count - 1
        
        while left <= right {
            let mid = left + ((right - left) / 2)
            if nums[mid] > target {
                right = mid - 1
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                return mid
            }
        }
        
        return right + 1
    }
}
