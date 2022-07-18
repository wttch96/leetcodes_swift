//
//  235.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/16.
//

import Foundation

///
/// 235. 二叉搜索树的最近公共祖先
///
class Solution235 {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let head = root, let p1 = p, let q1 = q else {
            return nil
        }
        if p1.val < head.val && q1.val < head.val {
            return self.lowestCommonAncestor(head.left, p1, q1)
        }
        if p1.val > head.val && q1.val > head.val {
            return self.lowestCommonAncestor(head.right, p1, q1)
        }
        return head
    }
    
    public class TreeNode {
        public var val: Int
        public var left: TreeNode?
        public var right: TreeNode?
        public init(_ val: Int) {
            self.val = val
            self.left = nil
            self.right = nil
        }
    }
}
