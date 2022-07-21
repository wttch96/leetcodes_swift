//
//  43.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/21.
//

import Foundation

///
/// 43. 字符串相乘
///
/// 应该可以使用多个一组优化, 懒得搞了
///
class Solution43 {
    static func test() {
        let solution = Solution43()
        print(solution.multiply("99999", "99"))
    }
    
    func multiply(_ num1: String, _ num2: String) -> String {
        // 处理恶心的0
        if num1 == "0" || num2 == "0" {
            return "0"
        }
        
        let ints1 = num1.map({ Int($0.asciiValue ?? 0) - 48 }).reversed()
        let ints2 = num2.map({ Int($0.asciiValue ?? 0) - 48 }).reversed()
        
        var sumArray: [[Int]] = []
        for v1 in ints1 {
            var carry = 0
            var sums: [Int] = []
            for v2 in ints2 {
                let sum = v1 * v2 + carry
                carry = sum / 10
                sums.append(sum % 10)
            }
            while carry > 0 {
                sums.append(carry % 10)
                carry /= 10
            }
            sumArray.append(sums)
        }
        var sums: [Int] = []
        for (i, line) in sumArray.enumerated() {
            if i == 0 {
                sums = line
            } else {
                var carry = 0
                var tmpSums:[Int] = []
                // 加第 i 行, 要错开 i 相加, 都加到 sums 上
                for j in 0..<max(sums.count, i + line.count) {
                    let n1 = j < sums.count ? sums[j] : 0
                    let n2 = j >= i && j - i < line.count ? line[j - i] : 0
                    let sum = n1 + n2 + carry
                    tmpSums.append(sum % 10)
                    carry = sum / 10
                }
                while carry > 0 {
                    tmpSums.append(carry % 10)
                    carry /= 10
                }
                sums = tmpSums
            }
        }
        var res = ""
        for i in sums.reversed() {
            res.append("\(i)")
        }
        return res
    }
}
