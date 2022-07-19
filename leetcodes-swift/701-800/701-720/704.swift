//
//  701.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/19.
//

import Foundation

///
/// 704. 二分查找
///
class Solution704 {
    func search(_ nums: [Int], _ target: Int) -> Int {
        return binarySearch(nums, target)
    }
    
    // 通用二分查找, 后面可以直接复制用
    func binarySearch<T>(_ array: [T], _ target: T) -> Int where T : Comparable {
        var left = 0
        var right = array.count - 1
        while left <= right {
            let mid = left + (right - left) / 2
            if array[mid] == target {
                return mid
            } else if array[mid] > target {
                right = right - 1
            } else {
                left = mid + 1
            }
        }
        
        return -1
    }
}
