//
//  93.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/8/1.
//

import Foundation

///
/// 93. 复原 IP 地址
///
class Solution93 {
    
    static func test() {
        let solution = Solution93()
        print(solution.restoreIpAddresses("25525511135"))
        print(solution.restoreIpAddresses("0000"))
        print(solution.restoreIpAddresses("101023"))
    }
    
    
    private var ints: [Int] = []
    private var res: [String] = []
    
    func restoreIpAddresses(_ s: String) -> [String] {
        ints = s.map({ Int($0.asciiValue!) - 48 })
        res = []
        var curRes: [Int] = []
        dfs(&curRes, 0)
        return res
    }
    
    func dfs(_ curRes: inout [Int], _ segStart: Int) {
        if segStart == ints.count {
            // 长度用完
            if curRes.count == 4 {
                // 段数为4
                res.append(curRes.map({ "\($0)" }).joined(separator: "."))
            }
            return
        }
        
        // 如果出现前导0
        if ints[segStart] == 0 {
            curRes.append(0)
            dfs(&curRes, segStart + 1)
        }
        
        var seg = 0
        for segEnd in segStart..<ints.count {
            seg = seg * 10 + ints[segEnd]
            if seg > 0 && seg <= 255 {
                // 寻找合适的一段
                let tmp = curRes
                curRes.append(seg)
                dfs(&curRes, segEnd + 1)
                curRes = tmp
            } else {
                break
            }
        }
    }
}
