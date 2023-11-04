//
//  189.swift
//  leetcodes-swift
//
//  Created by Wttch on 2023/9/4.
//

import Foundation

///
/// 189. 轮转数组
/// 给定一个整数数组 nums，将数组中的元素向右轮转 k 个位置，其中 k 是非负数。
class Solution189 {
    func rotate(_ nums: inout [Int], _ k: Int) {
        guard !nums.isEmpty else { return }
        
        let size = nums.count
        
        for i in 0..<size {
            let rotateIndex = (i + k) % size
            let tmp = nums[rotateIndex]
            nums[rotateIndex] = nums[i]
            nums[i] = tmp
        }
    }
    
    static func test() {
        let solution = Solution189()
        var array = [1, 2, 3, 4, 5, 6, 7]
        solution.rotate(&array, 3)
        print(array)
    }
}
