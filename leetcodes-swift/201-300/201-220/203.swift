//
//  203.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/18.
//

import Foundation


///
/// 203. 移除链表元素
///
class Solution203 {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        var head = head
        // 先移除头部所有等于 val 的
        while head != nil {
            if head?.val == val {
                head = head?.next
            } else {
                break
            }
        }
        if head == nil {
            return nil
        }
        
        // 删除后面等于 val 的元素
        var node = head
        var next = head?.next
        while next != nil {
           if next?.val == val {
                node?.next = next?.next
            } else {
                node = next
            }
            next = node?.next
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
