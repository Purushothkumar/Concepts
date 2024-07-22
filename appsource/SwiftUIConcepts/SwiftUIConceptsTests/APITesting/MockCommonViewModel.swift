//
//  MockCommonViewModel.swift
//  SwiftUIConceptsTests
//
//  Created by Purushoth on 22/07/24.
//

import XCTest
@testable import SwiftUIConcepts


final class MockCommonViewModel: XCTestCase {
    var mockService:MockCommonService!
    var mockdatabase:CommentsDelegate!
    var viewModel:CommentViewModel!

    


    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockService = MockCommonService()
        mockdatabase = MockDataBaseHandler()
        viewModel = CommentViewModel(serviceHandler: mockService,databaseHandler: mockdatabase)
  }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.

        mockService = nil
        mockdatabase = nil
        viewModel = nil
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


    func testFetchComments_whenConnected_shouldFetchFromService() {
        //Given
        mockService.mockComments = [CommentModel(postID: 1,id: 1,name: "kdnfksdn",email: "ndfns@dk.com",body: "asnfjdsjnfjansdj")]
        mockService.shouldReturnError = false
        viewModel.isConnected = true

        //When
        viewModel.fetchComments()

        //Then

//        print(viewModel.comments[0].name)
        XCTAssertEqual(viewModel.comments.count, 1)




//        // Given
//        mockService.mockComments = [CommentModel(id: 1, text: "Test Comment")]
//        viewModel.isConnected = true
//
//        // When
//        viewModel.fetchComments()
//
//        // Then
//        XCTAssertEqual(viewModel.comments.count, 1)
//        XCTAssertEqual(viewModel.comments.first?.text, "Test Comment")
    }

    func testFetchComments_whenNotConnected_shouldFetchFromDatabase() {
//        // Given
//        MockDataBaseHandler.mockComments = [CommentModel(id: 1, text: "Test Comment")]
//        viewModel.isConnected = false
//
//        // When
//        viewModel.fetchComments()
//
//        // Then
//        XCTAssertEqual(viewModel.comments.count, 1)
//        XCTAssertEqual(viewModel.comments.first?.text, "Test Comment")
    }

    func testFetchComments_whenServiceReturnsError_shouldHandleError() {
//        // Given
//        mockdatabase.shouldReturnError = true
//        viewModel.isConnected = true
//
//        // When
//        viewModel.fetchComments()
//
//        // Then
//        XCTAssertEqual(viewModel.comments.count, 0)
    }

    func testFetchComments_whenDatabaseReturnsError_shouldHandleError() {
//        // Given
//        mockDatabaseHandler.shouldReturnError = true
//        viewModel.isConnected = false
//
//        // When
//        viewModel.fetchComments()
//
//        // Then
//        XCTAssertEqual(viewModel.comments.count, 0)
    }

    func testFetchUsers_shouldFetchFromService() {
//        // Given
//        mockServiceHandler.mockUsers = [UserModel(id: 1, name: "Test User")]
//
//        // When
//        viewModel.fetchUsers()
//
//        // Then
//        XCTAssertEqual(viewModel.users.count, 1)
//        XCTAssertEqual(viewModel.users.first?.name, "Test User")
    }

    func testFetchUsers_whenServiceReturnsError_shouldHandleError() {
//        // Given
//        mockServiceHandler.shouldReturnError = true
//
//        // When
//        viewModel.fetchUsers()
//
//        // Then
//        XCTAssertEqual(viewModel.users.count, 0)
    }

}


