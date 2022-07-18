//
//  225.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/18.
//

import Foundation

///
/// 225. 用队列实现栈
///
/// 两个队列: 1个存储队列, 1个临时队列, 除了push时, 临时队列都是空
///
/// push时:
/// 1. 来的数据先扔临时队列
/// 2. 将所有存储队列数据放入临时队列
/// 3. 交换两个队列
///
class MyStack {
    
    static func test() {
        let myStack = MyStack()
        myStack.push(1)
        myStack.push(2)
        print(myStack.top())
        print(myStack.pop())
        print(myStack.empty())
    }

    private var storageQueue: [Int] = []
    private var tmpQueue: [Int] = []
    
    init() {

    }
    
    func push(_ x: Int) {
        tmpQueue.append(x)
        
        while !storageQueue.isEmpty {
            tmpQueue.append(storageQueue.removeFirst())
        }
        let tmp = storageQueue
        storageQueue = tmpQueue
        tmpQueue = tmp
    }
    
    func pop() -> Int {
        storageQueue.removeFirst()
    }
    
    func top() -> Int {
        storageQueue.first!
    }
    
    func empty() -> Bool {
        storageQueue.isEmpty
    }
}
