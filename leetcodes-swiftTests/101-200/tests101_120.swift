//
//  leetcodesTests.swift
//  leetcodesTests
//
//  Created by Wttch on 2022/7/7.
//

import XCTest
@testable import leetcodes_swift

final class tests101_120: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test118() throws {
        Solution118.Solution.test()
    }
    
    func test119() throws {
        Solution119.Solution.test()
    }
    
    func test120() throws {
        Solution120.test()
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
