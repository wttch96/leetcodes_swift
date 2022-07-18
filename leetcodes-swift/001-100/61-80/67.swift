//
//  59.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/7.
//

import Foundation


///
/// 67. 二进制求和`
///
class Solution67 {
    func addBinary(_ a: String, _ b: String) -> String {
        if a.isEmpty { return b }
        if b.isEmpty { return a }
        
        var res = ""
        
        var carry = 0
        for i in 1 ... max(a.count, b.count) {
            let n1 = i <= a.count ? (a[a.index(a.endIndex, offsetBy: -i)] == "0" ? 0 : 1) : 0
            let n2 = i <= b.count ? (b[b.index(b.endIndex, offsetBy: -i)] == "0" ? 0 : 1) : 0
            let sum = n1 + n2 + carry
            res = "\(sum % 2)" + res
            carry = sum / 2
        }
        if carry == 1 {
            res = "1" + res
        }
        return res
    }
    
    static func test() {
        let solution = Solution67()
        assert(solution.addBinary("100001", "1") == "100010")
        assert(solution.addBinary("11", "11") == "110")
        assert(solution.addBinary("1011", "1010") == "10101")
    }
}
