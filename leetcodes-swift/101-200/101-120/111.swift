//
//  111.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/13.
//

import Foundation


///
/// 111. 二叉树的最小深度
///
class Solution111 {
    func minDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        var mindeep = Int.max
        minDepth(root, 1, &mindeep)
        return mindeep
    }
    
    func minDepth(_ root: TreeNode?, _ deep: Int, _ minDeep: inout Int)  {
        if let node = root {
            if node.left == nil && node.right == nil {
                minDeep = min(deep, minDeep)
                return
            }
            
            // 如果不是最小的, 找最小的, 出现最小的, 直接丢弃另一支
            if deep < minDeep {
                minDepth(node.left, deep + 1, &minDeep)
            }
            if deep < minDeep {
                minDepth(node.right, deep + 1, &minDeep)
            }
            
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
