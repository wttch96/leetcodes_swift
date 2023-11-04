//
//  Testable.swift
//  leetcodes-swift
//
//  Created by Wttch on 2023/11/4.
//

import Foundation

/// 可以测试的
protocol Testable {
    /// 构造函数
    init()
    
    /// 实际执行的 test 方法
    func test()
}

extension Testable {
    /// 单元测试调用的方法
    static func test() {
        Self.init().test()
    }
}
