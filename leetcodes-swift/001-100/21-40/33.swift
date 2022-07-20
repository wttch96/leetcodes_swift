//
//  33.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/20.
//

import Foundation

///
/// 33. 搜索旋转排序数组
///
/// 变种二分搜索, 只需要确定那半边有序即可
/// 如果数据在有序的那一边就保留那边，否则继续搜索另一边
///
/// 半边有序:  如果中间数大于右边的数则左边有序，如果中间数小于右边的数则右边有序
///
class Solution33 {
    func search(_ nums: [Int], _ target: Int) -> Int {
        binarySearch(nums, target)
    }
    
    func binarySearch(_ array: [Int], _ target: Int) -> Int {
        var left = 0
        var right = array.count - 1
        while left <= right {
            let mid = left + (right - left) / 2
            if array[mid] == target {
                return mid
            }
            if array[mid] < array[right] {
                // 右边有序
                if array[mid] < target && array[right] >= target {
                    // 在有序区间
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            } else {
                // 左边有序
                if array[mid] > target && array[left] <= target {
                    // 在有序区间
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
        }
        
        return -1
    }
}
