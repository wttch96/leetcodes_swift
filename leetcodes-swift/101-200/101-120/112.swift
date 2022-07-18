//
//  112.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/13.
//

import Foundation


///
/// 112. 路径总和
///
class Solution112 {
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        childSumEquals(root, targetSum)
    }
    
    func childSumEquals(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        if let node = root {
            let sub = targetSum - node.val
            if sub == 0 && node.left == nil && node.right == nil {
                return true
            } else if childSumEquals(node.left, sub) {
                return true
            } else if childSumEquals(node.right, sub) {
                return true
            }
        }
        return false
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
