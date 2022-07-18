//
//  119.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/13.
//

import Foundation


///
/// 119. 杨辉三角 II
///
class Solution119 {
    class Solution {
        
        static func test() {
            let solution = Solution119.Solution()
            print(solution.getRow(10))
            print(solution.getRow(5))
        }
        
        // 缓存, 算过的都先保存起来
        static var cache: [[Int]] = Array(repeating: [], count: 34)
        
        init() {
            // 初始化个塔顶
            Solution.cache[0] = [1]
            Solution.cache[1] = [1, 1]
        }
        
        func getRow(_ row: Int) -> [Int] {
            let rowIndex = row + 1
            var begin = 0
            for i in 0..<rowIndex {
                if !Solution.cache[i].isEmpty {
                    // 看看前几层缓存了
                    begin = i
                    break
                }
            }
            if begin > 0 {
                return Solution.cache[begin]
            }
            for i in begin..<rowIndex {
                var line: [Int] = []
                // 生成第i行
                for j in 0...i {
                    if j == 0 || j == i {
                        line.append(1)
                    } else {
                        let beforeLine = Solution.cache[i - 1]
                        line.append(beforeLine[j - 1] + beforeLine[j])
                    }
                }
                // 缓存第i行
                Solution.cache[i] = line
            }
            
            return Solution.cache[rowIndex - 1]
        }
    }
}
