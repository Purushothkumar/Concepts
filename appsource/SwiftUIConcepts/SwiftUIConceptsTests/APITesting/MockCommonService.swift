//
//  MockCommonService.swift
//  SwiftUIConceptsTests
//
//  Created by Purushoth on 22/07/24.
//

import Foundation
@testable import SwiftUIConcepts

class MockCommonService: CommonServiceDelegate {

    var shouldReturnError = false
        var mockComments: [CommentModel] = []
        var mockUsers: [UserModel] = []

    func fetchComments(completion: @escaping(Result<[CommentModel], APIError>) -> Void){
        if shouldReturnError {
            completion(.failure(.DecodingError))
        }
        else
        {
            completion(.success(mockComments))
        }
    }

    func fetchUsers(completion: @escaping(Result<[UserModel], APIError>) -> Void){
        if shouldReturnError {
            completion(.failure(.DecodingError))
        }
        else
        {
            completion(.success(mockUsers))
        }
    }
}
