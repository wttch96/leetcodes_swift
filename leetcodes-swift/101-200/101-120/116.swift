//
//  116.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/28.
//

import Foundation

///
/// 116. 填充每个节点的下一个右侧节点指针
///
/// 两种做法
/// 1. 层序遍历然后连接
/// 2. 层序先链接本层, 然后下一层的右侧节点的next就是父节点的next的left
///
class Solution116 {
    func connect(_ root: Node?) -> Node? {
        guard let node = root else { return nil }
        solution1(node)
        return node
    }
    
    // 方法1: 先层序遍历, 后连接
    func solution1(_ root: Node) {
        var levels: [[Node]] = [[root]]
        var queue: [Node] = [root]
        // 层序遍历
        while !queue.isEmpty {
            var levelQueue: [Node] = []
            for node in queue {
                if let left = node.left, let right = node.right {
                    levelQueue.append(left)
                    levelQueue.append(right)
                }
            }
            queue = []
            if !levelQueue.isEmpty {
                levels.append(levelQueue)
                queue = levelQueue
            }
        }
        // 连接
        for level in levels {
            for i in 0..<level.count-1 {
                level[i].next = level[i + 1]
            }
        }
    }
    
    // 方法2: 层序链接本层然后直接连接下一层
    func solution2(_ root: Node)  {
        var leftHead: Node? = root
        while leftHead?.left != nil {
            var head = leftHead
            while head != nil {
                // 连接左右
                head?.left?.next = head?.right
                if head?.next != nil {
                    // 连接右和next的左
                    head?.right?.next = head?.next?.left
                }
                head = head?.next
            }
            // 下一层
            leftHead = leftHead?.left
        }
    }
    
    public class Node {
        public var val: Int
        public var left: Node?
        public var right: Node?
        public var next: Node?
        public init(_ val: Int) {
            self.val = val
            self.left = nil
            self.right = nil
            self.next = nil
        }
    }
}
