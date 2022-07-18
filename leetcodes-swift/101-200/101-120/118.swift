//
//  118.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/13.
//

import Foundation


///
/// 118. 杨辉三角
///
/// 缓存后, 用时 0ms
///
class Solution118 {
    
    class Solution {
        
        static func test() {
            let solution = Solution118.Solution()
            print(solution.generate(10))
            print(solution.generate(5))
        }
        // 缓存, 算过的都先保存起来
        static var cache: [[Int]] = Array(repeating: [], count: 30)
        
        init() {
            // 初始化个塔顶
            Solution.cache[0] = [1]
            Solution.cache[1] = [1, 1]
        }
        
        func generate(_ numRows: Int) -> [[Int]] {
            var begin = 0
            for i in 0..<numRows {
                if !Solution.cache[i].isEmpty {
                    // 看看前几层缓存了
                    begin = i
                    break
                }
            }
            var result: [[Int]] = []
            if begin > 0 {
                for i in 0..<begin {
                    // 缓存过的直接拿过来
                    result.append(Solution.cache[i])
                }
            }
            for i in begin..<numRows {
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
                result.append(line)
            }
            
            return result
        }
    }
}
