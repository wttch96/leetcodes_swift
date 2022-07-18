//
//  206.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/18.
//

import Foundation


///
/// 206. 反转链表
///
class Solution206 {
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        var pre: ListNode? = nil
        var cur = head
        
        while cur != nil {
            // 记录 next
            let next = cur?.next
            // 指针指向前一个
            cur?.next = pre
            // 向后移动
            pre = cur
            cur = next
        }
        return pre
    }
    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init() { self.val = 0; self.next = nil; }
        public init(_ val: Int) { self.val = val; self.next = nil; }
        public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }
}
