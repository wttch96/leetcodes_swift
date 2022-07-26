//
//  92.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/26.
//

import Foundation

///
/// 92. 反转链表 II
///
class Solution92 {
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        let dummy: ListNode? = ListNode(0, head)
        var pre = dummy
        for _ in 0..<left - 1 {
            pre = pre?.next
        }
        let cur = pre?.next
        var next: ListNode?
        for _ in 0..<right-left {
            // 头插
            // next 插在 pre 和 cur 之间
            // cur.next -> next.next
            next = cur?.next
            cur?.next = next?.next
            next?.next = pre?.next
            pre?.next = next
        }
        
        return dummy?.next
    }
    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init() { self.val = 0; self.next = nil; }
        public init(_ val: Int) { self.val = val; self.next = nil; }
        public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }
}
