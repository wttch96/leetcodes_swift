//
//  1.swift
//  letcode
//
//  Created by Wttch on 2022/4/8.
//

import Foundation

///
/// 给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。
/// 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。
/// 你可以按任意顺序返回答案。
///
fileprivate class Solution1 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var result = [0, 0]
        var map = [Int : Int]()
        for (i, num) in nums.enumerated() {
            if map[num] != nil {
                result[0] = i
                result[1] = map[num]!
                return result
            }
            map[target - num] = i
        }
        return result
    }
}
