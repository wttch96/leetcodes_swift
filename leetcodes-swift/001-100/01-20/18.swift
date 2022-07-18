//
//  18.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/18.
//

import Foundation

///
/// 18. 四数之和
///
class Solution18 {
    
    static func test() {
        let solution = Solution18()
        print(solution.fourSum([1,0,-1,0,-2,2], 0))
    }
    
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        // 必须不少于3个
        guard nums.count >= 3 else {
            return []
        }
        
        let nums = nums.sorted()
        var res: [[Int]] = []
        for i in 0..<nums.count - 3 {
            let numI = nums[i]
            if numI >= 0 && nums[i] > target {
                // 剪枝
                break
            }
            
            if i > 0 && numI == nums[i - 1] {
                // 去重
                continue
            }
            
            for j in i + 1..<nums.count - 2 {
                if j > i + 1 && nums[j - 1] == nums[j] {
                    // 去重
                    continue
                }
            
                if (nums[i] + nums[j] > target && nums[i] + nums[j] >= 0) || (nums[i] + nums[j] > Int.max / 2) {
                    // 剪枝
                    break
                }
                // 和三数一样处理即可
                var left = j + 1
                var right = nums.count - 1
                while right > left {
                    // 防止溢出
                    let tmp: Int = numI + nums[j] + nums[left] + nums[right]
                    if tmp > target {
                        right -= 1
                    } else if tmp < target {
                        left += 1
                    } else {
                        res.append([numI, nums[j], nums[left], nums[right]])
                        // 去重
                        while right > left && nums[right] == nums[right - 1] {
                            right -= 1
                        }
                        while right > left && nums[left] == nums[left + 1] {
                            left += 1
                        }
                        right -= 1
                        left += 1
                    }
                }
            }
        }
        return res
    }
}
