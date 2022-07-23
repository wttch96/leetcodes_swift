//
//  75.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/23.
//

import Foundation

///
/// 75. 颜色分类
///
/// 遇到0扔最前面
/// 遇到1扔最后面
/// 其余补1就行
///
class Solution75 {
    func sortColors(_ nums: inout [Int]) {
        // 0 保存的位置
        var zeroI = 0
        // 左侧
        var l = 0
        // 右侧
        var r = nums.count - 1
        while l <= r {
            if nums[l] == 0 {
                // 0 就放到 0 的位置
                // 0位置和左侧位置一起移动
                let tmp = nums[zeroI]
                nums[zeroI] = nums[l]
                nums[l] = tmp
                zeroI += 1
                l += 1
            } else if nums[l] == 2 {
                // 交换左侧和右侧
                let tmp = nums[r]
                nums[r] = nums[l]
                nums[l] = tmp
                r -= 1
            } else {
                // 左侧前移
                l += 1
            }
        }
    }
}
