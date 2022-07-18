//
//  125.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/13.
//

import Foundation

///
/// 125. 验证回文串
///
/// 不要用 String.Index(x, offset), 是真TM慢啊！
///
class Solution125 {
    
    static func test() {
        let solution = Solution125()
        assert(solution.isPalindrome("A man, a plan, a canal: Panama"))
        assert(!solution.isPalindrome("race a car"))
        assert(solution.isPalindrome("a."))
        assert(!solution.isPalindrome("ab"))
        assert(solution.isPalindrome(" "))
        assert(solution.isPalindrome("a a"))
    }
    
    func isPalindrome(_ s: String) -> Bool {
        if s.isEmpty {
            return true
        }
        let chars = Array(s.unicodeScalars)
        var l = 0
        var r = s.count - 1
        
        // 双指针
        while l < r {
            // 左边找合适的字母
            var lValue:UInt32 = 0
            repeat {
                lValue = valid(chars[l].value)
                l += 1
            } while l <= r && lValue == 0
            // 右面找合适的字母
            var rValue:UInt32 = 0
            repeat {
                rValue = valid(chars[r].value)
                r -= 1
            } while l <= r && rValue == 0
            // 俩值不相等
            if (lValue * rValue != 0) && lValue != rValue {
                return false
            }
        }
        
        return true
    }
    
    
    // 48-59, 65-90, 97-122
    func valid(_ value: UInt32) -> UInt32 {
        if value >= 48 && value <= 57 {
            return value
        }
        if value >= 65 && value <= 90 {
            return value
        }
        if value >= 97 && value <= 122 {
            return value - 32
        }
        return 0
    }
}
