//
//  103.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/15.
//

import Foundation

///
/// 103. 二叉树的锯齿形层序遍历
///

class Solution103 {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let node = root else {
            // 空，直接结束
            return []
        }
        // 每行的队列
        var queue: [TreeNode] = [node]
        var res: [[Int]] = []

        // 是否翻转层，第一层不翻转
        var reverse = false
        
        while !queue.isEmpty {
            var level: [Int] = []
            var nextLevelNode: [TreeNode] = []
            // 队列中的所有节点都遍历，并且将字节点都入一个新队列
            while !queue.isEmpty {
                // 取新节点
                let curNode = queue.removeFirst()
                level.append(curNode.val)
                if let l = curNode.left {
                    nextLevelNode.append(l)
                }
                if let r = curNode.right {
                    nextLevelNode.append(r)
                }
            }
            // 下一层
            queue = nextLevelNode
            if reverse {
                level = level.reversed()
            }
            // 添加结果
            res.append(level)
            // 下一层翻转
            reverse = !reverse
        }
        return res
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
