//
//  919.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/25.
//

import Foundation

///
/// 919. 完全二叉树插入器
///
class CBTInserter {
    private var root: TreeNode?
    private var queue: [TreeNode]

    init(_ root: TreeNode?) {
        self.root = root
        self.queue = []
        var tmpQueue = [root!]
        while !tmpQueue.isEmpty {
            // 寻找所有的可以添加的节点的位置，放到 queue 中
            let node: TreeNode = tmpQueue.removeFirst()
            if let left = node.left {
                if let right = node.right {
                    // 满树了, 就全部先扔到临时节点
                    tmpQueue.append(left)
                    tmpQueue.append(right)
                } else {
                    // 左结点扔临时节点, 当前节点入队列表示可以向当前节点添加元素
                    tmpQueue.append(left)
                    queue.append(node)
                }
            } else {
                // 当前节点可以添加元素
                queue.append(node)
            }
        }
    }
    
    func insert(_ val: Int) -> Int {
        let node = queue.first
        let newNode = TreeNode(val)
        if let _ = node?.left {
            node?.right = newNode
            // 两个元素都存在了,当前节点就不能再添加元素了
            queue.removeFirst()
        } else {
            // 只添加了左节点, 右侧节点还能添加, 所以暂时不删除当前节点
            node?.left = newNode
        }
        // 新增的节点入队
        queue.append(newNode)
        return node!.val
    }
    
    func get_root() -> TreeNode? {
        return self.root
    }
    
    public class TreeNode {
        public var val: Int
        public var left: TreeNode?
        public var right: TreeNode?
        public init() { self.val = 0; self.left = nil; self.right = nil; }
        public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
        public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
            self.val = val
            self.left = left
            self.right = right
        }
    }
}
