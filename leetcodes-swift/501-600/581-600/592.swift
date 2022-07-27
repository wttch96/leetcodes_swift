//
//  592.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/27.
//

import Foundation

///
/// 592. 分数加减运算
///
class Solution592 {
    
    static func test() {
        let solution = Solution592()
        assert(solution.fractionAddition("-1/2+1/2") == "0/1")
        assert(solution.fractionAddition("-1/2+1/2+1/3") == "1/3")
        assert(solution.fractionAddition("1/3-1/2") == "-1/6")
    }
    
    func fractionAddition(_ expression: String) -> String {
        let chars: [Character] = expression.map({ $0 })
        var numerator = 0
        var denominator = 1
        var i = 0
        while i < chars.count {
            var sign = true
            // 判断正负号
            if chars[i] == "-" || chars[i] == "+" {
                if chars[i] == "-" {
                    sign = false
                }
                i += 1
            }
            // 分子
            var numerator1 = 0
            while i < chars.count && chars[i].isNumber {
                numerator1 = numerator1 * 10 + (Int(chars[i].asciiValue!) - 48)
                i += 1
            }
            i += 1
            // 分母
            var denominator1 = 0
            while i < chars.count && chars[i].isNumber {
                denominator1 = denominator1 * 10 + (Int(chars[i].asciiValue!) - 48)
                i += 1
            }
            // 加
            let n1 = numerator * denominator1
            let n2 = numerator1 * denominator
            numerator = sign ? n1 + n2 : n1 - n2
            denominator = denominator * denominator1
        }
        // 分子为 0
        if numerator == 0 { return "0/1" }
        // 记录正负号
        let sign = numerator > 0
        numerator = abs(numerator)
        // 最大公约数
        let gcd = gcd(numerator, denominator)
        return "\(sign ? "" : "-")\(numerator / gcd)/\(denominator / gcd)"
    }
    
    // 最大公约数
    func gcd(_ a: Int, _ b: Int) -> Int {
        var x = a, y = b
        while y != 0 {
            (x, y) = (y, x % y)
        }
        return x
    }
}
