//
//  66.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/12.
//

import Foundation

///
/// 66. 加一
///
/// 简单的加一
///
class Solution66 {
    
    static func test() {
        let solution = Solution66()
        print(solution.plusOne([9, 9]))
    }
    
    func plusOne(_ digits: [Int]) -> [Int] {
        var carry = 1
        var result: [Int] = []
        for i in 0..<digits.count {
            let v = digits[digits.count - 1 - i] + carry
            if v >= 10 {
                // 进位
                result.append(v - 10)
                carry = 1
            } else {
                // 不进位
                result.append(v)
                carry = 0
            }
        }
        if carry != 0 {
            result.append(carry)
        }
        result = result.reversed()
        return result
    }
}
