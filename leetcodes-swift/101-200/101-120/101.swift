//
//  101.swift
//  letcode
//
//  Created by Wttch on 2022/7/6.
//

import Foundation

fileprivate class TreeNode {
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


fileprivate class Solution101 {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        return isSymmetric(root?.left, root?.right)
    }

    func isSymmetric(_ node1: TreeNode?, _ node2: TreeNode?) -> Bool {
        if node1 == nil && node2 == nil {
            return true
        }
        
        if node1 == nil || node2 == nil || node1?.val != node2?.val {
            return false
        }
        
        return isSymmetric(node1?.left, node2?.right) && isSymmetric(node2?.left, node1?.right)
    }
}
