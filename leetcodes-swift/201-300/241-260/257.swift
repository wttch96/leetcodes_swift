//
//  257.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/22.
//

import Foundation

///
/// 257. 二叉树的所有路径
///
class Solution {
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        var res: [String] = []
        dfs(root, [], &res)
        return res
    }
    
    func dfs(_ root: TreeNode?, _ path: [Int], _ res: inout [String]) {
        guard let node = root else {
            return
        }
        
        var path1 = path
        
        path1.append(node.val)
        
        if node.left == nil && node.right == nil {
            var str = "\(path1[0])"
            for i in 1..<path1.count {
                str += "->\(path1[i])"
            }
            res.append(str)
            return
        }
        dfs(node.left, path1, &res)
        dfs(node.right, path1, &res)
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
