//
//  58.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/7.
//

import Foundation

///
/// 58. 最后一个单词的长度
///
/// 给你一个字符串 s，由若干单词组成，单词前后用一些空格字符隔开。返回字符串中 最后一个 单词的长度。
/// 单词 是指仅由字母组成、不包含任何空格字符的最大子字符串。
///
public class Solution58 {
    func lengthOfLastWord(_ s: String) -> Int {
        var begin = 0
        var begined = false
        for i in 0 ..< s.count {
            if begined {
                if s[s.index(s.endIndex, offsetBy: -i - 1)] == " " {
                    // 结束
                    return i - begin
                }
            } else {
                if s[s.index(s.endIndex, offsetBy: -i - 1)] == " " && s[s.index(s.endIndex, offsetBy: -i - 2)] != " " {
                    // 找 "x "
                    begined = true
                    begin = i + 1
                } else if s[s.index(s.endIndex, offsetBy: -i - 1)] != " " && i == 0 {
                    // 开始就是字母
                    begin = i
                    begined = true
                }
            }
        }
        // 没有前面的空格
        return s.count - begin
    }
    
    static func test() {
        let solution = Solution58()
        assert(solution.lengthOfLastWord("Hello World") == 5)
        assert(solution.lengthOfLastWord("luffy is still joyboy") == 6)
        assert(solution.lengthOfLastWord("   fly me   to   the moon  ") == 4)
        assert(solution.lengthOfLastWord("a") == 1)
    }
}
