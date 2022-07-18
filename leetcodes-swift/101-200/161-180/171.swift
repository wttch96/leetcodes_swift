//
//  171.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/17.
//

import Foundation


///
/// 171. Excel 表列序号
///
class Solution171 {
    func titleToNumber(_ columnTitle: String) -> Int {
        var res = 0
        for char in columnTitle.enumerated().reversed() {
            let val = Int(char.element.asciiValue ?? 0) - 65
            res = res * 26 + val + 1
        }
        return res
    }
}
