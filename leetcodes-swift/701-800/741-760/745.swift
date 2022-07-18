//
//  745.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/14.
//

import Foundation

///
/// 745. 前缀和后缀搜索
///
/// 可以把前缀/后缀整体放到一个map里去，然后进行查找
///
class WordFilter745 {
    
    static func test() {
        let wordFilter = WordFilter745(["apple"])
        print(wordFilter.f("a", "e"))
    }
    
    // 前缀树
    var prefixTree: TreeNode = TreeNode()
    // 后缀树
    var suffixTree: TreeNode = TreeNode()
    
    var cache: [String: Int] = [:]
    
    init(_ words: [String]) {
        for i in 0..<words.count {
            let chars = chars(words[i])
            buildPrefixTree(chars, i)
            buildSuffixTree(chars, i)
        }
    }
    
    func f(_ pref: String, _ suff: String) -> Int {
        let prefChars: [Int] = chars(pref)
        let suffChars: [Int] = chars(suff)
        
        var prefIndexs: [Int] = []
        var prefNode = prefixTree
        for prefChar in prefChars {
            if let node = prefNode.children[prefChar] {
                // 存在节点
                prefNode = node
                prefIndexs = node.indexs
            } else {
                // 没有路径
                prefIndexs = []
                break
            }
        }
        
        
        var suffIndexs: [Int] = []
        var suffNode = suffixTree
        for i in 0..<suffChars.count {
            let suffChar = suffChars[suffChars.count - 1 - i]
            if let node = suffNode.children[suffChar] {
                // 存在节点
                suffNode = node
                suffIndexs = node.indexs
            } else {
                // 没有路径
                suffIndexs = []
                break
            }
        }
        
        let key = pref + "#" + suff
        if let c = cache[key] {
            return c
        }
        
        var maxIndex = -1
        for i in prefIndexs {
            for j in suffIndexs {
                if i == j && i > maxIndex {
                    maxIndex = i
                }
            }
        }
        cache[key] = maxIndex
        return maxIndex
    }
    
    
    ///
    /// 构建前缀树
    ///
    func buildPrefixTree(_ chars: [Int], _ index: Int) {
        var node = prefixTree
        for i in 0..<chars.count {
            let char = chars[i]
            // 寻找结点位置
            let child = node.children[char] ?? TreeNode()
            if !child.indexs.contains(index) {
                child.indexs.append(index)
            }
            node.children[char] = child
            node = child
        }
    }
    
    ///
    /// 构建后缀树
    ///
    func buildSuffixTree(_ chars: [Int], _ index: Int) {
        var node = suffixTree
        for i in 0..<chars.count {
            let char = chars[chars.count - 1 - i]
            // 寻找结点位置
            let child = node.children[char] ?? TreeNode()
            if !child.indexs.contains(index) {
                child.indexs.append(index)
            }
            node.children[char] = child
            node = child
        }
    }
    
    
    ///
    /// 讲字符串转换为到 'a' 的索引
    ///
    func chars(_ word: String) -> [Int] {
        return word.unicodeScalars.map({ Int($0.value - 97) })
    }
    
    class TreeNode {
        // 包含的单词索引
        var indexs: [Int] = []
        // 所有字节点
        var children: [TreeNode?] = Array(repeating: nil, count: 26)
    }
}
