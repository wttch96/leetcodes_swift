//
//  202.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/18.
//

import Foundation

///
/// 202. 快乐数
///
/// 数字按题目操作后一定会出现环, 找到相交的值就 ok 了
///
/// 可以参考环形链表使用快慢指针
///
class Solution202 {
    func isHappy(_ n: Int) -> Bool {
        var fast = n
        var slow = n
        repeat {
            slow = squareSum(slow)
            fast = squareSum(fast)
            fast = squareSum(fast)
        } while slow != fast
        if fast == 1 {
            return true
        } else {
            return false
        }
    }
    
    private func squareSum(_ m: Int) -> Int {
        var num = m
        var squaresum = 0
        while(num != 0){
            squaresum += (num % 10) * (num % 10)
            num /= 10
        }
        return squaresum
    }
}
