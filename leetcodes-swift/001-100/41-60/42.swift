//
//  424.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/21.
//

import Foundation

///
/// 42. 接雨水
///
/// 先找到每个柱子左右侧的最大值
/// 然后该柱子上能存 max(left[i], right[i]) - height[i] 的水, 相加即可
/// 此方法简单但是稍微耗时
///
/// 可以两头开始，记录左右的最大值，然后向中间逼近求可以积攒的雨水和
///
class Solution42 {
    
    static func test() {
        let solution = Solution42()
        print(solution.trap([0,1,0,2,1,0,1,3,2,1,2,1]))
    }
    
    func trap(_ height: [Int]) -> Int {
        let size = height.count
        var res = 0
        var lowMax = 0
        var l = 0
        var r = size - 1
        while l < r {
            var low: Int = 0
            if height[l] <= height[r] {
                low = height[l]
                l += 1
            } else {
                low = height[r]
                r -= 1
            }
            lowMax = max(lowMax, low)
            res += lowMax - low
        }
        
        return res
    }
}
