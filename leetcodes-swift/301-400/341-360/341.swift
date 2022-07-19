//
//  341.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/19.
//

import Foundation

///
/// 341. 扁平化嵌套列表迭代器
///
/// 不整那么多花里胡哨的, 直接展开
///
class NestedIterator {
    private var list: [Int] = []
    
    init(_ nestedList: [NestedInteger]) {
        add(nestedList)
    }
    
    private func add(_ nestedList: [NestedInteger]) {
        for nested in nestedList {
            if nested.isInteger() {
                list.append(nested.getInteger())
            } else {
                add(nested.getList())
            }
        }
    }
    
    func next() -> Int {
        list.removeFirst()
    }
    
    func hasNext() -> Bool {
        !list.isEmpty
    }
    
    
    
    // This is the interface that allows for creating nested lists.
    // You should not implement it, or speculate about its implementation
    class NestedInteger {
        // Return true if this NestedInteger holds a single integer, rather than a nested list.
        func isInteger() -> Bool { false }

        // Return the single integer that this NestedInteger holds, if it holds a single integer
        // The result is undefined if this NestedInteger holds a nested list
        func getInteger() -> Int { -1 }

        // Set this NestedInteger to hold a single integer.
        func setInteger(value: Int) {}

        // Set this NestedInteger to hold a nested list and adds a nested integer to it.
        func add(elem: NestedInteger) {}

        // Return the nested list that this NestedInteger holds, if it holds a nested list
        // The result is undefined if this NestedInteger holds a single integer
        func getList() -> [NestedInteger] { [] }
    }
}
