//
//  757.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/22.
//

import Foundation

///
/// 757. 设置交集大小至少为2
///
/// 贪心:(参考的题解)
/// 1、首先按照右端点从小到大排序；
/// 2、不妨让p1和p2代表目前选址中的最大两个数，那么初始值就应该是第一个区间的右端点处的两个值，
///     原因是：尽量选取靠右的数字可以增大与后边区间相交的可能性；
/// 3、于是就从第二个区间开始验证，假设俩数字都在区间内，那么无需处理；
/// 4、假如较大的数字都不在区间内，说明俩数都不在区间内，那么需要增加俩数字，也就是吧这个区间的最右端的俩点换上（这里由于已经按右端点排序了，所以新的俩点肯定分别大于旧的俩点）；
/// 5、假如较大的数字在区间内，但是较小的数字不在，那么需要多加一个数（尽量少换数字，因为题目问的是最小数量），
///     这里分两种情况：
///     1）此时较大的数字是右端点，那么需要把较小的数字移动到较大数字的左侧即可；
///     2）否则，较小的数字变成此时的较大的数字，较大的数字变成区间的右端点
///
class Solution757 {
    static func test() {
        let solution = Solution757()
        print(solution.intersectionSizeTwo([[1, 3], [1, 4], [2, 5], [3, 5]]))
    }
    
    
    func intersectionSizeTwo(_ intervals: [[Int]]) -> Int {
        guard intervals.count >= 1 else { return intervals.count }
        
        let intervals = intervals.sorted { a, b in
            if a[1] == b[1] {
                return a[0] > b[0]
            }
            return a[1] < b[1]
        }
        // 记录所有需要的点
        var res:[Int] = []
        for interval in intervals {
            let l = interval[0]
            let r = interval[1]
            if res.isEmpty {
                // 空的时候
                res = [r - 1, r]
            } else {
                let size = res.count
                if res[size - 1] < l {
                    // 相交0点, 先取一个保证一次
                    res.append(r - 1)
                }
                // else 相交一个点 继续判断
                
                // 已经相交一次了
                if res[size - 2] < l {
                    // 再加一次
                    res.append(r)
                }
                // else 两次 跳过
            }
        }
        
        
        return res.count
    }
}
