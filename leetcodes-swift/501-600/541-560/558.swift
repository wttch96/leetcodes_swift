//
//  558.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/15.
//

import Foundation

///
/// 558. 四叉树交集
///
class Solution558 {
    func intersect(_ quadTree1: Node?, _ quadTree2: Node?) -> Node? {
        if let tree1 = quadTree1, let tree2 = quadTree2 {
            if tree1.isLeaf && tree1.val || tree2.isLeaf && !tree2.val {
                // tree1 为叶子结点1 或者 tree2 为叶子结点0
                return tree1
            } else if tree1.isLeaf && !tree1.val || tree2.isLeaf && tree2.val {
                // tree1 为叶子结点0 或者 tree2 为叶子结点1
                return tree2
            } else {
                // 分治
                let lt = intersect(tree1.topLeft, tree2.topLeft)
                let rt = intersect(tree1.topRight, tree2.topRight)
                let lb = intersect(tree1.bottomLeft, tree2.bottomLeft)
                let rb = intersect(tree1.bottomRight, tree2.bottomRight)
                if let tl = lt, let tr = rt, let bl = lb, let br = rb {
                    // 合并节点
                    if tl.isLeaf && tr.isLeaf && bl.isLeaf && br.isLeaf && tl.val == tr.val && tl.val == bl.val && tl.val == br.val {
                        return tl
                    }
                }
                // 分治结果
                let node = Node(false, false)
                node.topLeft = lt
                node.topRight = rt
                node.bottomLeft = lb
                node.bottomRight = rb
                return node
            }
        }
        return nil
    }
    
    public class Node {
        public var val: Bool
        public var isLeaf: Bool
        public var topLeft: Node?
        public var topRight: Node?
        public var bottomLeft: Node?
        public var bottomRight: Node?
        public init(_ val: Bool, _ isLeaf: Bool) {
            self.val = val
            self.isLeaf = isLeaf
            self.topLeft = nil
            self.topRight = nil
            self.bottomLeft = nil
            self.bottomRight = nil
        }
    }
}
