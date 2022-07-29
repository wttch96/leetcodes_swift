//
//  155.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/29.
//

import Foundation

///
/// 155. 最小栈
///
/// 保留最小值和当前元素差值
/// 如果差值小于0则替换最小值
/// 取:
/// 如果栈顶元素小于0, 取最小值, 然后将最小值改为最小值减栈顶元素
/// 如果栈顶元素大于0, 取最小值加上栈顶元素, 最小值不变
///
/// 存
/// 栈元素             7,  8,  4,  3
/// 和最小值差值  0,  1,  -3, -1 （存这个）
/// 目前最小值      7,  7,  4, 3
/// 取
/// 栈元素             3,  4,  8,  7
/// 最小值改为      4,  7,  7,  7
///
class MinStack {
    private var stack: [Int] = []
    private var minValue = -1

    init() {

    }
    
    func push(_ val: Int) {
        if stack.isEmpty {
            // 空栈, 最小值为当前元素, 栈入0
            minValue = val
            stack.append(0)
        } else {
            // 差值
            let diff = val - minValue
            if diff < 0 {
                // 差值小于零说明发现了新的最小值
                minValue = val
            }
            // 差值入栈
            stack.append(diff)
        }
    }
    
    func pop() {
        // 移除最后一个元素
        let last = stack.removeLast()
        if last < 0 {
            // 最小值小于0, 最小值要变化
            minValue = minValue - last
        }
    }
    
    func top() -> Int {
        let last = stack.last!
        // 获取最后一个元素
        if last < 0 {
            // 小于零, 就返回最小值
            return minValue
        } else {
            // 大于零, 返回最小值加上最后一个元素
            return last + minValue
        }
    }
    
    func getMin() -> Int {
        minValue
    }
}
