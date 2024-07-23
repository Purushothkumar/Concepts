//
//  TestClosureSample.swift
//  SwiftUIConceptsTests
//
//  Created by Purushoth on 23/07/24.
//

import XCTest
@testable import SwiftUIConcepts

final class TestClosureSample: XCTestCase {

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


    func testAddTwoNumbers() {
            let sample = ClosureSample()

            let expectation = self.expectation(description: "Completion handler invoked")

            sample.addTwoNumbers(5, andnum2: 10) { result in
                XCTAssertEqual(result, 15, "Expected 5 + 10 to equal 15")
                expectation.fulfill()
            }

            waitForExpectations(timeout: 1, handler: nil)
        }


}
