//
//  DataBaseHandler.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 18/07/24.
//

import Foundation

//class DataBaseHandler: DataBaseProtocol{
//    func getComment(completion: @escaping (Result<[CommentModel], DemoErrorModel>) -> Void) {
//
//        guard let url = Bundle.main.url(forResource: "Comment", withExtension: "json"),
//              let data = try? Data(contentsOf: url),
//              let model = try? JSONDecoder().decode([CommentModel].self, from: data) else {
//                return   completion(.failure(.DecodingError))
//        }
//        completion(.success(model))
//    }
//}
