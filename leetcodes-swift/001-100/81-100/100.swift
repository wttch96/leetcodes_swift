//
//  100.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/13.
//

import Foundation


///
/// 100. 相同的树
///
class Solution100 {
    static var x = 0
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            // 都为 nil, 算相等
            return true
        }
        if let l = p, let r = q {
            if l.val == r.val {
                // 值相等
                return isSameTree(l.left, r.left) && isSameTree(l.right, r.right)
            } else {
                // 不等
                return false
            }
        } else {
            // 某支为空
            return false
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
