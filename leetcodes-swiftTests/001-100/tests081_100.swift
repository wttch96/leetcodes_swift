//
//  leetcodesTests.swift
//  leetcodesTests
//
//  Created by Wttch on 2022/7/7.
//

import XCTest
@testable import leetcodes_swift

final class tests081_100: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test81() throws {
        Solution81.test()
    }
    
    func test84() throws {
        Solution84.test()
    }
    
    func test85() throws {
        Solution85.test()
    }
    
    func test87() throws {
        Solution87.test()
    }
    
    func test88() throws {
        Solution88.test()
    }
    
    func test89() throws {
        Solution89.test()
    }
    
    func test91() throws {
        Solution91.test()
    }
    
    func test93() throws {
        Solution93.test()
    }
    
    func test97() throws {
        runTest(Solution97.self)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
