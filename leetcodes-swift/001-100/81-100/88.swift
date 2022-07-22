//
//  88.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/12.
//

import Foundation


///
/// 88. 合并两个有序数组
///
class Solution88 {
    
    static func test() {
        let solution = Solution88()
        var nums1 = [0]
        let nums2 = [1]
        solution.merge(&nums1, 0, nums2, 1)
        print(nums1)
    }
    
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var cursur1 = m - 1
        var cursur2 = n - 1
        
        var count = 0
        while cursur1 >= 0 &&  cursur2 >= 0 {
            // 取最大的放 nums1 末尾
            let n1 = nums1[cursur1]
            let n2 = nums2[cursur2]
            
            if n1 > n2 {
                // nums1取的大
                nums1[m + n - 1 - count] = n1
                cursur1 -= 1
            } else {
                // nums2取的大
                nums1[m + n - 1 - count] = n2
                cursur2 -= 1
            }
            count += 1
        }
        
        if cursur1 == -1 {
            // nums1 无了
            for i in 0...(m + n - 1 - count) {
                nums1[i] = nums2[i]
            }
        }
    }
}
