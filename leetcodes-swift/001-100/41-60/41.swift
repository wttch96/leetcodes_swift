//
//  41.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/21.
//

import Foundation

///
/// 41. 缺失的第一个正数
///
/// 来自官解：原地 hash
/// 1. 将所有小于等于0的改为 size + 1
/// 2. 将所有元素对应的原来地方的值取反(保证标识了, 并且不抛弃数据值, 防止数据丢失, 直接交换会导致一些数据顺序不正确:比如 [4, 3, -1, 1], 会无法保证 -1, 1的位置)
/// 3. 找到第一个不为负数的值即可, 找不到说明全部拥有, 返回 size + 1
///
class Solution41 {
    
    static func test() {
        let solution = Solution41()
        print(solution.firstMissingPositive([1, 2, 0]))
    }
    
    
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var nums1 = nums
        for i in 0..<nums1.count {
            let v = nums1[i]
            if v <= 0 {
                nums1[i] = nums1.count + 1
            }
        }
        
        for i in 0..<nums1.count {
            let v = abs(nums1[i])
            if v <= nums1.count {
                nums1[v - 1] = -abs(nums1[v - 1])
            }
        }
        
        for (i, v) in nums1.enumerated() {
            if v >  0 {
                return i + 1
            }
        }
        
        return nums1.count + 1
    }
}
