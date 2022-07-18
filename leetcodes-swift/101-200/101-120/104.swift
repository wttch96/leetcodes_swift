//
//  104.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/13.
//

import Foundation


///
/// 104. 二叉树的最大深度
///
class Solution104 {
    
    func maxDepth(_ root: TreeNode?) -> Int {
        if let node = root {
            // 节点存在, 两支最大值加1
            return max(maxDepth(root?.left), maxDepth(node.right)) + 1
        }
        // 节点不存在: 0
        return 0
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
