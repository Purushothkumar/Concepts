//
//  MockDatabaseHandler.swift
//  SwiftUIConceptsTests
//
//  Created by Purushoth on 22/07/24.
//

import Foundation
@testable import SwiftUIConcepts

class MockDataBaseHandler: CommentsDelegate {
    
    var shouldReturnError = false
    var mockComments: [CommentModel] = []

    func fetchComments(completion: @escaping (Result<[CommentModel], APIError>) -> Void) {
        if shouldReturnError {
            completion(.failure(.DecodingError))
        }
        else
        {
            completion(.success(mockComments))
        }
    }
}
