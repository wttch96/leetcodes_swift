//
//  735.swift
//  leetcodes
//
//  Created by Wttch on 2022/7/13.
//

import Foundation

///
/// 735. 行星碰撞
///
class Solution735 {
    
    static func test() {
        let solution = Solution735()
        print(solution.asteroidCollision([10, 2, -5]))
        print(solution.asteroidCollision([5, 10, -5]))
        print(solution.asteroidCollision([8, -8]))
        print(solution.asteroidCollision([8, -8, -8]))
        print(solution.asteroidCollision([-2,-1,1,2]))
    }
    
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        if asteroids.count <= 1 {
            return asteroids
        }
        var res: [Int] = []
        for i in asteroids {
            if res.isEmpty {
                res.append(i)
            } else {
                var num = i
                var next = false
                repeat {
                    // 满足条件一直撞
                    if let top = res.last {
                        if top > 0 && top + num == 0 {
                            // 湮灭
                            res.removeLast()
                            next = true
                            break
                        }
                        
                        if top > 0 && num < 0 {
                            // 碰撞
                            res.removeLast()
                            if abs(top) > abs(num) {
                                num = top
                            }
                        } else {
                            // 相同符号, 入栈
                            break
                        }
                    }
                } while !res.isEmpty
                if !next {
                    res.append(num)
                }
            }
        }
        return res
    }
}
