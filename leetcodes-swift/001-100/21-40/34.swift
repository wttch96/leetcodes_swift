//
//  34.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/19.
//

import Foundation

///
/// 34. 在排序数组中查找元素的第一个和最后一个位置
///
class Solution34 {
    
    static func test() {
        let solution = Solution34()
        print(solution.searchRange([2, 2], 2))
    }
    
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        let targetIndex = binarySearch(nums, target)
        
        guard targetIndex != -1 else {
            return [-1, -1]
        }
        
        var left = targetIndex
        var right = targetIndex
        
        // 向左移动, 提前观测
        while left - 1 >= 0 && nums[left - 1] == target {
            left -= 1
        }
        
        // 向右移动, 提前观测
        while right + 1 < nums.count && nums[right + 1] == target {
            right += 1
        }
        
        return [left, right]
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
