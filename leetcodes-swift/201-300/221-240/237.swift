//
//  237.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/23.
//

import Foundation

///
/// 237. 删除链表中的节点
///
/// 将下一个节点的值放在当前节点, 然后删除下一个节点
///
class Solution237 {
    func deleteNode(_ node: ListNode?) {
        guard let n = node else { return }
        n.val = n.next!.val
        n.next = n.next?.next
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
