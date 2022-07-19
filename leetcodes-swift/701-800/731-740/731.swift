//
//  731.swift
//  leetcodes-swift
//
//  Created by Wttch on 2022/7/19.
//

import Foundation

///
/// 731. 我的日程安排表 II
///
/// 直接暴力
///
class MyCalendarTwo {
    private var books: [(Int, Int)] = []
    private var books2: [(Int, Int)] = []

    init() {

    }
    
    func book(_ start: Int, _ end: Int) -> Bool {
        if books2.contains(where: { (s, e) in e > start && s < end }) {
            // 二重预定里有
            return false
        }
        for (s, e) in books {
            if s < end && e > start {
                // 将相交的集合放入二重预定
                books2.append((max(s, start), min(e, end)))
            }
        }
        books.append((start, end))
        return true
    }
}
