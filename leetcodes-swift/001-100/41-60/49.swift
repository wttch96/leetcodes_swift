//
//  49.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/12.
//

import Foundation

///
/// 49. 字母异位词分组
///
/// 排序, hash, 放入集合
///
class Solution449 {
    
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        guard !strs.isEmpty else {
            return [[String]]()
        }
        
        var map: [String: [String]] = [:]
        for str in strs {
            var tmp = Array(repeating: 0, count: 26)
            // 字母计数
            for char in str.unicodeScalars {
                tmp[Int(char.value - 97)] += 1
            }
            var key = ""
            // 重新拼接
            for i in 0..<tmp.count {
                key += String(repeating: String(UnicodeScalar(UInt32(97 + i)) ?? "a"), count: tmp[i])
            }
            var sets = map[key, default: []]
            sets.append(str)
            map[key] = sets
        }
        return Array(map.values)
    }
}
