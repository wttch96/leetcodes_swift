//
//  83.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/12.
//

import Foundation

///
/// 83. 删除排序链表中的重复元素
///
/// 简单的链表操作
///
class Solution83 {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        
        var cursur = head
        
        while cursur != nil {
            var next = cursur?.next
            while next != nil && next?.val == cursur?.val {
                // 删除所有相等的数据
                next = next?.next
                cursur?.next = next
            }
            // 指针后移
            cursur = cursur?.next
        }
        return head
    }
    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init() { self.val = 0; self.next = nil; }
        public init(_ val: Int) { self.val = val; self.next = nil; }
        public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }
}
