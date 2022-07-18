//
//  142.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/15.
//

import Foundation

///
/// 141. 环形链表 II
///
/// 快慢指针
/// 设环长 b, 入口为 a, 相遇于 a + x
/// 相遇时: x + mb + a  + 1 = x + a + nb, x + mb + a + 1 = 2(x + a + nb) ===> (m - n)b + 1 = 0, mb  + 1 = x + a + 2nb
/// a = -nb - x ===> a = -(n + 1)b  + b - x 即从 a,x 起跑一样速度必定会在差 n+1 圈后相遇在 a 点
///
class Solution142 {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var slow = head?.next
        var fast = slow?.next

        // 空值就结束
        if slow == nil || fast == nil {
           return nil
        }

        // 判断对象而不是值
        while slow !== fast {
           slow = slow?.next
           fast = fast?.next?.next
           if fast == nil {
               // 空值就结束
               return nil
           }
        }

        // 跑几圈 必追上
        var begin = head
        while begin !== slow {
           begin = begin?.next
           slow = slow?.next
        }

        return begin
    }
    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
}
