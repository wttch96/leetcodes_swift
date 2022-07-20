//
//  31.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/20.
//

import Foundation

///
/// 31. 下一个排列
///
/// 其实就是从数组倒着查找
/// 找到nums[i] 比nums[i+1]小的时候
/// 就将nums[i]跟nums[i+1]到nums[nums.length - 1]当中找到一个最小的比nums[i]大的元素交换
/// 交换后，再把nums[i+1]到nums[nums.length-1]排序
///
class Solution31 {
    func nextPermutation(_ nums: inout [Int]) {
        for i in (0..<nums.count).reversed() {
            for j in (i+1..<nums.count).reversed() {
                if nums[j] > nums[i] {
                    // 交换
                    let tmp = nums[j]
                    nums[j] = nums[i]
                    nums[i] = tmp
                    // swift部分排序~
                    let sub = nums[i+1..<nums.count]
                    nums.replaceSubrange(i+1..<nums.count, with: sub.sorted())
                    return
                }
            }
        }
        nums.sort()
    }
}
