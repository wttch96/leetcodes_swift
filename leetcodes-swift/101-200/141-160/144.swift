//
//  144.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/15.
//

import Foundation

///
/// 144. 二叉树的前序遍历
///

class Solution144 {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var res: [Int] = []
        preorderTraversal(root, &res)
        return res
    }
    
    func preorderTraversal(_ root: TreeNode?, _ res: inout [Int]) {
        if let node = root {
            res.append(node.val)
            preorderTraversal(node.left, &res)
            preorderTraversal(node.right, &res)
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
