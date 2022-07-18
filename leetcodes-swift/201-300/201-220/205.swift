//
//  205.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/18.
//

import Foundation

///
/// 205. 同构字符串
///
/// 要同时hash: a ----> b, b --必定--> a
///
class Solution205 {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else {
            return false
        }
        
        var s2tMap: [Character: Character] = [:]
        var t2sMap: [Character: Character] = [:]
        let sChars: [Character] = s.map({ $0 as Character})
        let tChars: [Character] = t.map({ $0 as Character})
        for i in 0..<sChars.count {
            let sChar = sChars[i]
            let tChar = tChars[i]
            
            if s2tMap[sChar] == nil && t2sMap[tChar] == nil {
                // 都为空
                s2tMap[sChar] = tChar
                t2sMap[tChar] = sChar
            } else if s2tMap[sChar] == tChar && t2sMap[tChar] == sChar {
                // 相等
                continue
            } else {
                // 不想等
                return false
            }
        }
        return true
    }
}
