//
//  101.swift
//  letcode
//
//  Created by Wttch on 2022/7/6.
//

import Foundation


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
