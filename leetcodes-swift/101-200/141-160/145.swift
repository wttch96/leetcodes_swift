//
//  145.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/15.
//

import Foundation

///
/// 145. 二叉树的后序遍历
///
class Solution145 {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var res: [Int] = []
        postorderTraversal(root, &res)
        return res
    }
    
    func postorderTraversal(_ root: TreeNode?, _ res: inout [Int]) {
        if let node = root {
            postorderTraversal(node.left, &res)
            postorderTraversal(node.right, &res)
            res.append(node.val)
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
