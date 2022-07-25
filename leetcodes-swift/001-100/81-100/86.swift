//
//  86.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/25.
//

import Foundation

///
/// 86. 分隔链表
///
class Solution86 {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        let dummy1 = ListNode(0)
        let dummy2 = ListNode(0)
        var p1: ListNode? = dummy1
        var p2: ListNode? = dummy2
        var cur = head
        while cur != nil {
            // 分别拼装
            if cur!.val < x {
                p1!.next = cur
                p1 = p1!.next
            } else {
                p2!.next = cur
                p2 = p2!.next
            }
            cur = cur?.next
        }
        // 断开尾巴, 不然最后的数据可能会循环会主链表去
        p2?.next = nil
        // 连接两个链表
        p1?.next = dummy2.next
        return dummy1.next
    }
    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init() { self.val = 0; self.next = nil; }
        public init(_ val: Int) { self.val = val; self.next = nil; }
        public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }
}
