//
//  69.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/12.
//

import Foundation

///
/// 69. x 的平方根
///
/// 只保留整数
///
/// 二分查找
///
class Solution69 {
    
    static func test() {
        let solution = Solution69()
        for i in 0...100 {
            print(i, solution.mySqrt(i))
        }
    }
    
    func mySqrt(_ x: Int) -> Int {
        if x == 0 {
            return 0
        } else if x <= 3 {
            return 1
        }
        var l = 0
        var r = x
        while l <= r {
            let mid = (l + r) / 2
            if x / mid >= mid {
                if x / (mid + 1) < (mid + 1) {
                    return mid
                } else {
                    l = mid
                }
            } else {
                r = mid
            }
        }
        
        return 0
    }
}
