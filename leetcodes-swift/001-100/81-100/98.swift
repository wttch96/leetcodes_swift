//
//  98.swift
//  leetcodes-swift
//
//  Created by Wttch on 2023/11/4.
//

import Foundation


///
/// 98. 验证二叉搜索树
///
/// ⚠️：要保证左子树全部小于根节点，右子树全部大于根节点
///
class Solution98 {
    private init() {
        
    }
    
    private func isValidBST(_ root: TreeNode?, _ min: Int = .min, _ max: Int = .max) -> Bool {
        // 根为空
        guard let root = root else { return true }
        // 根值不满足条件
        guard root.val < max && root.val > min else { return false }
        
        // 左子树存在: 不满足 (值小于 root；子树是二叉搜索树)
        if let left = root.left, !isValidBST(left, min, root.val) {
            return false
        }
        // 右子树存在: 不满足 (值大于 root；子树是二叉搜索树)
        if let right = root.right, !isValidBST(right, root.val, max) {
            return false
        }
        
        return true
    }
}
