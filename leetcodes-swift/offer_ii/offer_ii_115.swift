//
//  offer_ii_115.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/23.
//

import Foundation

///
/// 剑指 Offer II 115. 重建序列
///
class SolutionOfferII115 {
    
    static func test() {
        let solution = SolutionOfferII115()
        print(solution.sequenceReconstruction([1,2,3], [[1,2],[1,3]]))
        //print(solution.sequenceReconstruction([1,2,3], [[1,2],[1,3],[2,3]]))
    }
    
    func sequenceReconstruction(_ nums: [Int], _ sequences: [[Int]]) -> Bool {
        let n = nums.count
        // 元素的所有来源
        var toNode: [[Int]] = Array(repeating: [], count: n + 1)
        // 入度
        var inDegree = Array(repeating: 0, count: n + 1)
        for sequence in sequences {
            for i in 1..<sequence.count {
                toNode[sequence[i - 1]].append(sequence[i])
                inDegree[sequence[i]] += 1
            }
        }
        // 0度的所有元素
        var zeroQueue: [Int] = []
        for i in 1..<inDegree.count {
            let degree = inDegree[i]
            if degree == 0 {
                zeroQueue.append(i)
            }
        }
        
        while !zeroQueue.isEmpty {
            // 当前只能有一个入度为0的，如果有多个就没法判断这里面节点的顺序
            if zeroQueue.count != 1 {
                return false
            }
            // 0度的元素
            let curFrom: Int = zeroQueue.removeFirst()
            // 0度可以到达的元素
            for curTo in toNode[curFrom] {
                inDegree[curTo] -= 1
                // 度不为0继续循环执行
                if inDegree[curTo] == 0 {
                    zeroQueue.append(curTo)
                }
            }
        }
        
        for i in 1...n {
            // 存在入度不为0的元素, 给的序列里的东西就太多了
            if inDegree[i] != 0 {
                return false
            }
        }
        
        return true
    }
}
