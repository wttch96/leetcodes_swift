//
//  108.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/13.
//

import Foundation


///
/// 108. 将有序数组转换为二叉搜索树
///
/// 分治
///
class Solution108 {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        var nums1 = nums
        // 使用引用好像能减少不少时间
        return sortedArrayToBST(&nums1, 0, nums.count - 1)
    }
    
    func sortedArrayToBST(_ nums: inout [Int], _ l: Int, _ r: Int) -> TreeNode? {
        if r < l {
            return nil
        }
        let mid = l + (r - l) / 2
        let root = TreeNode(nums[mid])
        // 左支
        root.left = sortedArrayToBST(&nums, l, mid - 1)
        // 右支
        root.right = sortedArrayToBST(&nums, mid + 1, r)
        return root
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
