//
//  76.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/25.
//

import Foundation

///
/// 76. 最小覆盖子串
///
/// 需要优化~
///
class Solution76 {
    
    static func test() {
        let solution = Solution76()
        print(solution.minWindow("ADOBECODEBANC", "ABC"))
        print(solution.minWindow("a", "aa"))
        print(solution.minWindow("a", "a"))
        print(solution.minWindow("", "xxxx"))
        print(solution.minWindow("xxxx", ""))
        print(solution.minWindow("ab", "b"))
    }
    
    func charMap(_ str: String) -> [Character: Int] {
        str.reduce([:]) { partialResult, char in
            var tmp = partialResult
            let count = (tmp[char] ?? 0) + 1
            tmp[char] = count
            return tmp
        }
    }
    
    private var l = 0
    private var r = 0
    private var tmpCharMap: [Character: Int] = [:]
    private var sChars: [Character] = []
    
    private func moveRight() {
        if r < sChars.count {
            let count = (tmpCharMap[sChars[r]] ?? 0) + 1
            tmpCharMap[sChars[r]] = count
        }
        r += 1
    }
    
    private func moveLeft() {
        if l < sChars.count {
            if var count = tmpCharMap[sChars[l]] {
                count -= 1
                tmpCharMap[sChars[l]] = count
            }
        }
        l += 1
    }
    
    func minWindow(_ s: String, _ t: String) -> String {
        let sSize = s.count
        let tSize = t.count
        guard sSize >= tSize else { return "" }
        sChars = s.map({ $0 })
        let tMap: [Character: Int] = charMap(t)
        
        l = 0
        r = tSize
        var finded = false
        var minL = 0
        var minR = 0
        var minLength = Int.max
        tmpCharMap = [:]
        for i in l..<r {
            let count = (tmpCharMap[sChars[i]] ?? 0) + 1
            tmpCharMap[sChars[i]] = count
        }
        while r <= sSize {
            if r - l < tSize {
                moveRight()
                continue
            }
            
            // 比对, 特别这里需要优化
            var flag = true
            for (k, v) in tMap {
                if tmpCharMap[k] == nil || tmpCharMap[k]! < v {
                    flag = false
                    break
                }
            }
            if flag {
                if r - l < minLength {
                    minLength = r - l
                    minL = l
                    minR = r
                }
                if !finded {
                    // 找到了
                    finded = true
                } else {
                    // 开始修改左侧
                    moveLeft()
                }
            } else {
                if finded {
                    // 找到了，但是移走了
                    finded = false
                } else {
                    // 没有找到, 移动右侧
                    moveRight()
                }
            }
        }
        var res = ""
        for i in minL..<minR {
            res.append(sChars[i])
        }
        return res
    }
}
