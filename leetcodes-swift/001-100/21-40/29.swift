//
//  29.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/19.
//

import Foundation

///
/// 29. 两数相除
///
class Solution29 {
    
    static func test() {
        let solution = Solution29()
        print(solution.divide(Int.min, -1))
    }
    
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        var dividend = dividend
        var divisor = divisor
        // 考虑 被除数 为最小值的情况
        if dividend == -2147483648 {
            if divisor == 1 {
                return -2147483648
            }
            if divisor == -1 {
                return 2147483647
            }
        }
        // 考虑 除数 为最小值的情况
        if divisor == -2147483648 {
            return dividend == -2147483648 ? 1 : 0
        }
        // 考虑被除数为 0 的情况
        if dividend == 0 {
            return 0
        }
        
        // 都转换为负数计算
        var res = false
        if dividend > 0 {
            dividend = -dividend
            res = !res
        }
        if divisor > 0 {
            divisor = -divisor
            res = !res
        }
        
        var nums = [divisor]
        // 除数乘2并保留
        while nums.last! >= dividend - nums.last! {
            nums.append(nums.last! << 1)
        }
        
        var ans = 0
        for i in 0..<nums.count {
            if nums[nums.count - 1 - i] >= dividend {
                // nums 的数相当于 2^(nums.count - 1 - i) 倍
                ans += (1 << (nums.count - 1 - i))
                dividend -= nums[nums.count - 1 - i]
            }
        }
        return res ? -ans : ans
    }
}
