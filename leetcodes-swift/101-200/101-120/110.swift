//
//  110.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/13.
//

import Foundation


///
/// 110. 平衡二叉树
///
class Solution110 {
    func isBalanced(_ root: TreeNode?) -> Bool {
        var isBalanced = true
        deep(root, &isBalanced)
        return isBalanced
    }
    
    func deep(_ node: TreeNode?, _ isBalanced: inout Bool) -> Int {
        if !isBalanced {
            // 不平衡了
            return Int.max
        }
        if let cur = node {
            // 左侧深度
            let deepL = deep(cur.left, &isBalanced) + 1
            // 不平衡立即结束
            if isBalanced {
                // 右侧深度
                let deepR = deep(cur.right, &isBalanced) + 1
                // 不平衡立即结束
                if isBalanced {
                    // 判断是否平衡
                    if abs(deepL - deepR) > 1 {
                        isBalanced = false
                    }
                    // 当前结点的最大深度
                    return max(deepL, deepR)
                }
            }
        }
        // 空节点的深度为0
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
