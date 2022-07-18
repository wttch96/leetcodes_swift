//
//  676.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/11.
//

import Foundation



//
// 676. 实现一个魔法字典
//
// Your MagicDictionary object will be instantiated and called as such:
// let obj = MagicDictionary()
// obj.buildDict(dictionary)
// let ret_2: Bool = obj.search(searchWord)
//
// 使用前缀树 + dfs
// 看评判结果 似乎暴力判断更快
//
class MagicDictionary {

    static func test676() {
        let magicDictionary = MagicDictionary()
        magicDictionary.buildDict(["hello", "judgg", "judge"])
        print(magicDictionary.search("juggg"))
    }
    
    
    private var root: TreeNode = TreeNode()
    
    init() {

    }
    
    func buildDict(_ dictionary: [String]) {
        for str in dictionary {
            var node: TreeNode? = nil
            for char in str {
                let charIndex: Int = Int((char.asciiValue ?? 0) - a)
                if node == nil {
                    // 第一个字母
                    node = root.children[charIndex] ?? TreeNode()
                    root.children[charIndex] = node
                } else {
                    // 剩余字母
                    let newNode = node?.children[charIndex] ?? TreeNode()
                    node?.children[charIndex] = newNode
                    node = newNode
                }
            }
            node?.isWord = true
        }
    }
    
    let a = Character("a").asciiValue ?? 0
    
    func search(_ searchWord: String) -> Bool {
        let chars = searchWord.map({ Int((Character("\($0)").asciiValue ?? 0) - a) })
        var isMod = false
        return dfs(root, 0, chars, &isMod)
    }
    
    
    private func dfs(_ node: TreeNode?, _ index: Int, _ word: [Int], _ isMod: inout Bool) -> Bool {
        if let curNode = node {
            if index == word.count {
                return isMod && curNode.isWord
            } else {
                for i in 0..<26 {
                    if let children = curNode.children[i] {
                        if word[index] == i {
                            if dfs(children, index + 1, word, &isMod) {
                                return true
                            }
                        } else {
                            if !isMod {
                                isMod = true
                                if dfs(children, index + 1, word, &isMod) {
                                    return true
                                }
                                isMod = false
                            }
                        }
                    }
                }
            }
        }
        return false
    }
    
    class TreeNode {
        var isWord = false
        var children: [TreeNode?] = Array(repeating: nil, count: 26)
    }
}

