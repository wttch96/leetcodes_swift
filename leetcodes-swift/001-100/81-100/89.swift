//
//  89.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/8/1.
//

import Foundation

///
/// 89. 格雷编码
///
/// 00  01
/// 0   1
/// 00  01   11  10
/// 0   1    3   2
/// 000  001  011  010  110 111  101  100
/// 0    1    3    2    6   7    5    4
///
/// 翻转上述数组并加上 2^ (n-1) 即  i <<n
///
class Solution89 {
    
    static func test() {
        let solution = Solution89()
        print(solution.grayCode(4))
    }
    
    func grayCode(_ n: Int) -> [Int] {
        var res: [Int] = [0, 1]
        if n == 1 { return res }
        
        for i in 2...n {
            let added = 1 << (i - 1)
            for j in stride(from: res.count - 1, through: 0, by: -1) {
                res.append(res[j] + added)
            }
        }
        
        return res
    }
}
