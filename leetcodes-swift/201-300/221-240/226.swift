//
//  226.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/16.
//

import Foundation

///
/// 226. 翻转二叉树
///
class Solution226 {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let head = root else {
            return nil
        }
        
        let left = head.left
        head.left = invertTree(head.right)
        head.right = invertTree(left)
        return head
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
