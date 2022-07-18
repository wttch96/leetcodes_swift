//
//  offer_ii_041.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/16.
//

import Foundation

///
/// 剑指 Offer II 041. 滑动窗口的平均值
///

class MovingAverage {

    var curSum: Double = 0
    var nums: [Int]
    var size: Int
    /** Initialize your data structure here. */
    init(_ size: Int) {
        self.size = size
        self.nums = []
    }
    
    func next(_ val: Int) -> Double {
        nums.append(val)
        curSum += Double(val)
        if nums.count > size {
            curSum -= Double(nums.removeFirst())
            return curSum / Double(size)
        } else {
            return curSum / Double(nums.count)
        }
    }
}
