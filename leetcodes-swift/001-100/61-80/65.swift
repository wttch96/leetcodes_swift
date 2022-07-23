//
//  65.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/23.
//

import Foundation

///
/// 65. 有效数字
///
/// 逃课~
///
class Solution65 {
    func isNumber(_ s: String) -> Bool {
        if s.contains("inf") || s.contains("Inf") {
            return false
        }
        if let _ = Double(s) {
            return true
        }
        return false
    }
}
