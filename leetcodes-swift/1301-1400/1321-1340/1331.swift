//
//  1331.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/28.
//

import Foundation

///
/// 1331. 数组序号转换
///
class Solution1331 {
    func arrayRankTransform(_ arr: [Int]) -> [Int] {
        var map: [Int: Int] = [:]
        // 去重, 排序 [100, 100, 100] 排名都是 1
        for (i, v) in Set(arr).sorted().enumerated() {
            // 记录数字排名
            map[v] = i
        }
        var res: [Int] = []
        for v in arr {
            // 获取排名
            res.append(map[v]! + 1)
        }
        return res
    }
}
