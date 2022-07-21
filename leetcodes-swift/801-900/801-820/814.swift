//
//  814.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/21.
//

import Foundation

///
/// 814. 二叉树剪枝
///
/// 递归, 先递归左右节点，结束后再查看当前节点，如果节点为两个0就返回 nil
///
class Solution814 {
    func pruneTree(_ root: TreeNode?) -> TreeNode? {
        guard let node = root else {
            return nil
        }
        
        if let left = node.left {
            // 检查左节点
            node.left = pruneTree(left)
        }
        if let right = node.right {
            // 检查右节点
            node.right = pruneTree(right)
        }
        
        if node.left == nil && node.right == nil && node.val == 0 {
            // 剪枝
            return nil
        }
        
        return node
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
