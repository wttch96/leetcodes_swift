//
//  1206.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/26.
//

import Foundation

///
/// 1206. 设计跳表
///
class Skiplist {
    // 最大层数
    private let MAX_LEVEL = 32;
    // 随机因子, 随出来就上升一层,
    private let P_FACTOR: Float = 0.25
    // 头
    private let head: ListNode
    // 当前层数
    private var level = 1

    init() {
        head = ListNode(-1, MAX_LEVEL)
    }

    func search(_ target: Int) -> Bool {
        var cur = self.head
        
        // 倒着找快(从上层向下找), 这就是跳表的优势所在, 类似实现了“链表二分查找”
        // 找最小最接近(并且小于)当前值的位置
        for i in stride(from: MAX_LEVEL - 1, through: 0, by: -1) {
            while cur.towards[i] != nil && cur.towards[i]!.val < target {
                cur = cur.towards[i]!
            }
        }
        // 已经到最底层了, 如果值还不存在或者不等, 就是没有
        return cur.towards[0]?.val == target
    }
    
    func add(_ num: Int) {
        let newLevel = randomLevel()
        self.level = max(self.level, newLevel)
        var update = Array(repeating: self.head, count: self.level)
        let node = ListNode(num, newLevel)
        var cur = self.head
        // 倒着找快(从上层向下找), 这就是跳表的优势所在, 类似实现了“链表二分查找”
        // 找最小最接近(并且小于)当前值的位置
        for i in stride(from: self.level - 1, through: 0, by: -1) {
            while cur.towards[i] != nil && cur.towards[i]!.val < num {
                cur = cur.towards[i]!
            }
            update[i] = cur
        }
        // 插入这些位置
        for i in 0..<newLevel {
            // 指向下一个节点
            node.towards[i] = update[i].towards[i]
            // 插入update[i]节点之后
            update[i].towards[i] = node
        }
    }
    
    func erase(_ num: Int) -> Bool {
        var update = Array(repeating: self.head, count: self.level)
        var cur = self.head
        // 倒着找快(从上层向下找), 这就是跳表的优势所在, 类似实现了“链表二分查找”
        // 找最小最接近(并且小于)当前值的位置
        for i in stride(from: self.level - 1, through: 0, by: -1) {
            while cur.towards[i] != nil && cur.towards[i]!.val < num {
                cur = cur.towards[i]!
            }
            update[i] = cur
        }
        // 没有找到
        if !(cur.towards[0]?.val == num) { return false }
        let node = cur.towards[0]!
        
        for i in 0..<self.level {
            if update[i].towards[i] !== node {
                // 已经超出该节点所在的最大层了
                break
            }
            // 删除节点
            update[i].towards[i] = node.towards[i]
        }
        // 更新下最大层数
        while self.level > 1 && self.head.towards[self.level - 1] == nil {
            self.level -= 1
        }
        return true
    }
    
    ///
    /// 生成随机层数
    ///
    private func randomLevel() -> Int {
        var level = 1
        while Float.random(in: 0..<1) <= P_FACTOR && level < MAX_LEVEL {
            level += 1
        }
        return level
    }
 
    /// 节点
    class ListNode {
        // 值
        var val: Int
        // 层数
        var level: Int
        // 所有指针
        var towards:[ListNode?]
        init(_ val: Int, _ level: Int) {
            self.val = val
            self.level = level
            self.towards = Array(repeating: nil, count: level)
        }
    }
}
