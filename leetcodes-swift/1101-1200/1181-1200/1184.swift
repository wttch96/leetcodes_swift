//
//  1184.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/24.
//

import Foundation

///
/// 1184. 公交站间的距离
///
/// 一遍遍历
/// 因为不知道 start 和 destination 的关系(好像也不影响结果)
/// 将数据分为三段 [0, start/destination] [start/destiantion, start/destiantion] [start/destiantion, n-1]
/// 求 min(第二段, 第一段 + 第三段)
///
/// 1 <= n <= 10^4
/// distance.length == n
/// 0 <= start, destination < n
///
class Solution1184 {
    func distanceBetweenBusStops(_ distance: [Int], _ start: Int, _ destination: Int) -> Int {
        var res1 = 0
        var res2 = 0
        let l = min(start, destination)
        let r = max(start, destination)
        for (i, v) in distance.enumerated() {
            if i >= l && i < r {
                // 第2段
                res2 += v
            } else {
                // 第1、3段
                res1 += v
            }
        }
        
        return min(res1, res2)
    }
}
