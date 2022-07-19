//
//  239.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/19.
//

import Foundation

///
/// 239. 滑动窗口最大值
///
/// 单调队列:
/// 每次都把小于当前元素的数据弹出，然后压入当前元素
/// 如果长度超过窗口就抛弃第一个
/// 头就是当前里面最大值
///
class Solution239 {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var window: [Int] = []
        var res: [Int] = []
        for (i, num) in nums.enumerated() {
            // 窗口只记录位置, 最大的值的位置已经被滑出去, 则丢弃
            if i >= k && window[0] <= i - k {
                window.removeFirst()
            }
            
            // 窗口不为空, 移除所有小于等于当前元素的值(保留等于可能会使窗口里的数据挤压过多导致错误、超时等)
            while !window.isEmpty && nums[window.last!] <= num {
                window.removeLast()
            }
            window.append(i)
            
            if i >= k - 1 {
                res.append(nums[window.first!])
            }
        }
        
        return res
    }
}
