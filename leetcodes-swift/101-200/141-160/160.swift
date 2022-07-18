//
//  160.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/16.
//

import Foundation

///
/// 160. 相交链表
///
/// 双指针, 那个链表到头了就指向另一个的头, 一直走到相等
/// 由于长度 a+b = b+a, 就算找不到相交点, 也会在最后都走向 nil
///
class Solution160 {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        guard headA != nil && headB != nil else {
            return nil
        }

        var pA = headA
        var pB = headB
        
        while pA !== pB {
            // pA = pA?.next ?? headB
            // pB = pB?.next ?? headA
            // pA/pB 是可选类型, 所以上述写法直接在 ?. 就结束了
            pA = (pA === nil ? headB : pA?.next)
            pB = (pB === nil ? headA : pB?.next)
        }
        return pA
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
