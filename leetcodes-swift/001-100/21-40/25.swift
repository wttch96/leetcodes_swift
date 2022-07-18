//
//  25.swift
//  letcode
//
//  Created by Wttch on 2022/7/6.
//

import Foundation

/// K 个一组翻转链表
///
/// 给你链表的头节点 head ，每 k 个节点一组进行翻转，请你返回修改后的链表。
/// k 是一个正整数，它的值小于或等于链表的长度。如果节点总数不是 k 的整数倍，那么请将最后剩余的节点保持原有顺序。
/// 你不能只是单纯的改变节点内部的值，而是需要实际进行节点交换。
///
fileprivate class Solution25 {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        // 头插法
        // 新头
        let dummy = ListNode(-1)
        dummy.next = head
        var size = 0
        var cur = head
        // 遍历
        while cur != nil {
            size += 1
            cur = cur?.next
        }
        // 分组
        var count = size / k
        var pre: ListNode? = dummy
        cur = head
        for i in 0..<count {
            for j in 0..<k-1 {
                var next = cur?.next
                cur!.next = next?.next
                next!.next = pre?.next
                pre!.next = next
            }
            pre = cur
            cur = cur?.next
        }
        return dummy.next
    }
}

///
/// 题目定义的节点
///
fileprivate class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
