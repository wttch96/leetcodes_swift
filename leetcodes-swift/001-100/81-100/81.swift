//
//  81.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/25.
//

import Foundation

///
/// 81. 搜索旋转排序数组 II
///
/// 变种二分查找, 同题目 33, 找到相同数字的时候左右移动下
///
class Solution81 {
    
    static func test() {
        let solution = Solution81()
        print(solution.search([1,1,1,1,1,1,1,1,1,13,1,1,1,1,1,1,1,1,1,1,1,1], 13))
    }
    
    func search(_ nums: [Int], _ target: Int) -> Bool {
        var l = 0
        var r = nums.count - 1
        while l <= r {
            let mid = l + (r - l) / 2
            if nums[mid] == target { return true }
            
            if nums[mid] == nums[l] && nums[mid] == nums[r] {
                r -= 1
                l += 1
            } else {
                if nums[r] >= nums[mid] {
                    // 右侧有序
                    if nums[mid] < target && target <= nums[r] {
                        // 右侧有序并且在右侧区间
                        l = mid + 1
                    } else {
                        r = mid - 1
                    }
                } else {
                    // 左侧有序
                    if nums[mid] > target && target >= nums[l] {
                        // 左侧有序并且在左区间
                        r = mid - 1
                    } else {
                        l = mid + 1
                    }
                }
            }
        }
        
        return false
    }
}
