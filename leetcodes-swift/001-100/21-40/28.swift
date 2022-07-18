//
//  28.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/16.
//

import Foundation

///
/// 28. 实现 strStr()
///
class Solution28 {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard !needle.isEmpty else {
            return 0
        }
        
        guard needle.count <= haystack.count else {
            return -1
        }
        
        let haystackChars = haystack.map({ $0 })
        let needleChars = needle.map({ $0 })
        
        var first = 0
        
        while first != haystack.count {
            var second = 0
            var flag = true
            while second != needle.count {
                if first + second >= haystack.count {
                    flag = false
                    break
                }
                if haystackChars[first + second] != needleChars[second] {
                    flag = false
                    break
                }
                second += 1
            }
            if flag {
                return first
            }
            first += 1
        }
        return -1
    }
}
