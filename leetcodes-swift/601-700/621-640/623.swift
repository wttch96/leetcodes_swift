//
//  623.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/8/5.
//

import Foundation

///
/// 623. 在二叉树中增加一行
///
class Solution623 {
    func addOneRow(_ root: TreeNode?, _ val: Int, _ depth: Int) -> TreeNode? {
        guard let node = root else { return nil }
        if depth > 2 {
            // 深度大于二, 递归左右子树
            let _ = addOneRow(node.left, val, depth - 1)
            let _ = addOneRow(node.right, val, depth - 1)
            return node
        } else if depth == 2 {
            // 深度为 2
            // 添加数据
            node.left = TreeNode(val, node.left, nil)
            node.right = TreeNode(val, nil, node.right)
            return node
        } else {
            // 深度小于2
            // 在跟节点上面插入
            return TreeNode(val, node, nil)
        }
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
