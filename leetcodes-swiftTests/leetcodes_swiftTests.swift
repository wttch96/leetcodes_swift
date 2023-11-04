//
//  leetcodes_swiftTests.swift
//  leetcodes-swiftTests
//
//  Created by Wttch on 2022/7/18.
//

import XCTest
@testable import leetcodes_swift

final class leetcodes_swiftTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}


extension XCTestCase {
    /// 执行 Testable 的 test 方法
    func runTest<T: Testable>(_ type: T.Type) {
        T.test()
    }
}
