//
//  30.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/14.
//

import Foundation

///
/// 30. 串联所有单词的子串
///

class Solution30 {
    
    static func test() {
        let solution = Solution30()
        print(solution.findSubstring("barfoothefoobarman", ["foo","bar"]))
        print(solution.findSubstring("wordgoodgoodgoodbestword", ["word","good","best","word"]))
        print(solution.findSubstring("barfoofoobarthefoobarman", ["bar","foo","the"]))
        print(solution.findSubstring("ababaab", ["ab","ba","ba"]))
        print(solution.findSubstring("mississippi", ["mississippis"]))
    }
    
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        if words.isEmpty {
            return []
        }
        
        let chars: [Character] = s.unicodeScalars.map({ Character($0) })
        let wordsChars: [[Character]] = words.map({ $0.unicodeScalars.map({ Character($0) }) })
        
        let wordsSorted = words.sorted()
        
        // 单词长度
        let wordLen = wordsChars[0].count
        
        if wordLen > s.count {
            return []
        }
        
        var res: [Int] = []
        
        // 滑动
        for offset in 0..<wordLen {
            var windowIndex = 0
            var windowSize = (chars.count - offset) / wordLen
            var windowWordSet:[String] = []

            // 滑动窗口进行比对
            repeat {
                // 窗口单词
                var windowWord = ""
                for j in 0..<wordLen {
                    windowWord.append(chars[offset + windowIndex * wordLen + j])
                }
                
                windowWordSet.append(windowWord)
                if windowWordSet.count == words.count + 1 {
                    windowWordSet.removeFirst()
                }
                if windowWordSet.count == words.count {
                    // 判断
                    if windowWordSet.sorted() == wordsSorted {
                        // 满足
                        res.append(offset + (windowIndex - words.count + 1) * wordLen)
                    }
                }
                
                windowIndex += 1
            } while windowIndex < windowSize
            
        }
        
        return res
    }
}
