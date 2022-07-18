//
//  232.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/18.
//

import Foundation

///
/// 232. 用栈实现队列
///
/// 1. 所有数据都放在存储栈
/// 2. 取数据的时候, 将所有存储栈的数据倒到临时栈
/// 3. 从临时栈拿数据即可
///
class MyQueue {
    var storageStack: [Int] = []
    var tmpStack: [Int] = []
    
    init() {

    }
    
    func push(_ x: Int) {
        storageStack.append(x)
    }
    
    func pop() -> Int {
        if tmpStack.isEmpty {
            while !storageStack.isEmpty {
                tmpStack.append(storageStack.removeLast())
            }
        }
        return tmpStack.removeLast()
    }
    
    func peek() -> Int {
        if tmpStack.isEmpty {
            while !storageStack.isEmpty {
                tmpStack.append(storageStack.removeLast())
            }
        }
        return tmpStack.last!
    }
    
    func empty() -> Bool {
        tmpStack.isEmpty && storageStack.isEmpty
    }
}
