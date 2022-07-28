//
//  114.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/28.
//

import Foundation

///
/// 114. 二叉树展开为链表
///
class Solution114 {
    
    private var lastNode: TreeNode?
    func flatten(_ root: TreeNode?) {
        guard let node = root else { return }
        // 右左中后序处理
        flatten(node.right)
        flatten(node.left)
        // 节点的右侧节点需要拼接到上层的前面
        node.right = lastNode
        // 左侧置空
        node.left = nil
        // 记录当前节点
        lastNode = node
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
