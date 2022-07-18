//
//  168.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/16.
//

import Foundation


///
/// 168. Excel表列名称
///
/// 就是 10 进制转 26 进制
///  1 - 26 就是 A - Z
///
class Solution168 {
    
    
    func convertToTitle(_ columnNumber: Int) -> String {
        var num = columnNumber
        var res = ""
        while num > 0 {
            // A 代表 1, 减一就能对应上了
            num -= 1
            let mod = num % 26
            if let char = UnicodeScalar(mod + 65) {
                res = String(char) + res
            }
            num /= 26
        }
        return res
    }
}
