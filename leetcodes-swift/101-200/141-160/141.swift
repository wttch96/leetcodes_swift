//
//  141.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/15.
//

import Foundation

///
/// 141. 环形链表
///
/// 快慢指针
///
class Solution141 {
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = slow?.next
        
        // 空值就结束
        if fast == nil {
            return false
        }
        
        // 判断对象而不是值
        while slow !== fast {
            slow = slow?.next
            fast = fast?.next?.next
            if fast == nil {
                // 空值就结束
                return false
            }
        }
        
        return true
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
