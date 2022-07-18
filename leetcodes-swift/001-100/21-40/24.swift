//
//  24.swift
//  letcode
//
//  Created by Wttch on 2022/7/6.
//

import Foundation

///
/// 给你一个链表，两两交换其中相邻的节点，并返回交换后链表的头节点。你必须在不修改节点内部的值的情况下完成本题（即，只能进行节点交换）。
///
fileprivate class Solution24 {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        // 多个 if-let 可以这么写
        if let h = head, let next = head?.next {
            // 递归交换第 3-n 个
            h.next = swapPairs(next.next)
            // 交换当前链表的前 2 个
            next.next = h
            return next
        }
        return head
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
