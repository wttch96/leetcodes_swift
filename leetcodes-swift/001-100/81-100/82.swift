//
//  82.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/25.
//

import Foundation

///
/// 82. 删除排序链表中的重复元素 II
///
class Solution82 {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        // nil
        guard let node = head else { return nil }
        
        let dummy = ListNode(0, node)
        var cur: ListNode? = dummy
        
        while cur?.next != nil && cur?.next?.next != nil {
            // 发现后面有元素相等
            if cur!.next!.next!.val == cur!.next!.val {
                let v = cur!.next!.val
                // 删除所有的相等元素
                while cur?.next != nil && cur?.next?.val == v {
                    cur?.next = cur?.next?.next
                }
            } else {
                cur = cur?.next
            }
        }
        
        return dummy.next
    }
    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init() { self.val = 0; self.next = nil; }
        public init(_ val: Int) { self.val = val; self.next = nil; }
        public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }
}
