//
//  219.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/18.
//

import Foundation


///
/// 219. 存在重复元素 II
///
class Solution219 {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        // 哈希记录数字所在的上一个位置
        var indexMap: [Int: Int] = [:]
        for i in 0..<nums.count {
            let num = nums[i]
            if let index = indexMap[num] {
                // 存在相同的元素
                if abs(i - index) <= k {
                    return true
                }
            }
            // 记录本次位置
            indexMap[num] = i
        }
        
        return false
    }
}
