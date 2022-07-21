//
//  File.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/20.
//

import Foundation

///
/// 38. 外观数列
///
/// 递归强算呗
///
class Solution38 {
    func countAndSay(_ n: Int) -> String {
        if n == 1 {
            return "1"
        }
        let res = say(["1"], 1, n)
        return String(res)
    }
    
    func say(_ str: [Character], _ i: Int, _ n: Int) -> [Character] {
        if i >= n {
            return str
        }
        var res: [Character] = []
        var j = 0
        while j < str.count {
            var index = j + 1
            while index < str.count && str[index] == str[j] {
                index += 1
            }
            res.append(Character("\(index - j)"))
            res.append(str[j])
            j = index
        }
        
        return say(res, i + 1, n)
    }
}
