//
//  622.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/8/2.
//

import Foundation

///
/// 622. 设计循环队列
///
class MyCircularQueue {

    private var queue: [Int]
    // 头, 当前头元素
    private var head = 0
    // 尾, 当前可插入的尾元素
    private var tail = 0
        
    init(_ k: Int) {
        // 多一个容量, 尾指向可插入的元素的位置,
        // 如果头尾相等则为空, 如果 尾下一个等于头则表示队列满
        queue = Array(repeating: 0, count: k + 1)
        head = 0
        tail = 0
    }
    
    func enQueue(_ value: Int) -> Bool {
        if isFull() {
            return false
        }
        // 入队
        queue[tail] = value
        // 位置移动
        tail = (tail + 1) % queue.count
        return true
    }
    
    func deQueue() -> Bool {
        if isEmpty() {
            return false
        }
        // 出队
        // 位置移动
        head = (head + 1) % queue.count
        return true
    }
    
    func Front() -> Int {
        isEmpty() ? -1 : queue[head]
    }
    
    func Rear() -> Int {
        isEmpty() ? -1 : queue[(tail - 1 + queue.count) % queue.count]
    }
    
    func isEmpty() -> Bool {
        tail == head
    }
    
    func isFull() -> Bool {
        return (tail + 1) % queue.count == head
    }
}
