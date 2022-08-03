//
//  889.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/8/3.
//

import Foundation


///
/// 899. 有序队列
///
/// 当k=1时, 就是循环产生的字符串中字典序最小的
/// 当k>1时, 就是整个串能生成的最小的字典序串
///
class Solution889 {
    func orderlyQueue(_ s: String, _ k: Int) -> String {
        var chars = s.map({ $0 })
        if k == 1 {
            var res = s
            for _ in 0..<chars.count {
                let first = chars.removeFirst()
                chars.append(first)
                res = min(res, String(chars))
            }
            return res
        } else {
            return String(chars.sorted())
        }
    }
}
