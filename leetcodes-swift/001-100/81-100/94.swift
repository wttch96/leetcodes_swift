//
//  94.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/13.
//

import Foundation


///
/// 94. 二叉树的中序遍历
///
/// 简单的中序遍历
///
class Solution96 {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        visit(root, &result)
        return result
    }
    
    func visit(_ node: TreeNode?, _ result: inout [Int]) {
        if let cur = node {
            visit(cur.left, &result)
            result.append(cur.val)
            visit(cur.right, &result)
        }
    }
    
    
    class TreeNode {
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
