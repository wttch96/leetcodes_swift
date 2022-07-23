//
//  68.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/23.
//

import Foundation

///
/// 68. 文本左右对齐
///
class Solution68 {
    
    static func test() {
        let solution = Solution68()
        print(solution.fullJustify(["This", "is", "an", "example", "of", "text", "justification."], 16))
        print(solution.fullJustify(["What", "must", "be", "acknowledgment", "shall", "be"], 16))
        print(solution.fullJustify(["ask","not","what","your","country","can","do","for","you","ask","what","you","can","do","for","your","country"], 16))
    }
    
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        var res: [String] = []
        
        var curLineWord: [String] = []
        var curLineLength = 0
        
        for word in words {
            let curWordLen = word.count
            if curLineLength + curWordLen + curLineWord.count > maxWidth {
                // 要先分割了
                let spaceNum = maxWidth - curLineLength
                var line = ""
                if curLineWord.count == 1 {
                    // 只有一个单词
                    line.append(curLineWord[0])
                    // 全部补空格
                    line.append(String(repeating: " ", count: spaceNum))
                } else {
                    // 前 remainSpaceNum 要加 perSpace + " "
                    // 后面只需要加 perSpace
                    let perSpace = String(repeating: " ", count: (spaceNum / (curLineWord.count - 1)))
                    let remainSpaceNum = spaceNum % (curLineWord.count - 1)
                    
                    for (i, w) in curLineWord.enumerated() {
                        line.append(w)
                        if i < curLineWord.count - 1 {
                            line.append(perSpace)
                            if i < remainSpaceNum {
                                // 多加一个空格
                                line.append(" ")
                            }
                        }
                    }
                }
                res.append(line)
                // 清除
                curLineWord = []
                curLineLength = 0
            }
            
            curLineWord.append(word)
            curLineLength += word.count
        }
        
        var line = ""
        var len = 0
        
        // 最后剩的元素
        for (i, w) in curLineWord.enumerated() {
            line.append(w)
            len += w.count
            if i < curLineWord.count - 1 {
                // 最后一个元素之前都补空格
                line.append(" ")
                len += 1
            } else {
                // 最后差的空格
                line.append(String(repeating: " ", count: maxWidth - len))
            }
        }
        res.append(line)
        
        return res
    }
}
