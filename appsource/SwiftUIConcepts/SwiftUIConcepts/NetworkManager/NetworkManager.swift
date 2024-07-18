//
//  NetworkManager.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 24/06/24.
//

import Foundation

enum APIError: Error{
    case BadURLError
    case NoResponseError
    case DecodingError

}

class NetworkManager{
    let aPIHandler: APIHandler
    let responseHandler: ResponseHandler
    init(aPIHandler: APIHandler = APIHandler(), responseHandler: ResponseHandler = ResponseHandler()) {
        self.aPIHandler = aPIHandler
        self.responseHandler = responseHandler
    }

    func fetchRequest(completion: @escaping(Result<[CommentModel], APIError>) -> Void){
        // URL
        guard let url = URL(string: APIURL.fetchComments) else{
            print("BadURLError")
            return completion(.failure(.BadURLError))
        }
        // API Handler
        aPIHandler.fetchData(url: url) { result in
            switch result {
            case .success(let data):
                    print(data)
                // Reponse Handler
                self.responseHandler.fetchModel(data: data) { decodedReponse in
                    switch decodedReponse {
                    case .success(let model):
                        completion(.success(model))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                    print(error)
            }
        }
    }
}

// API Handler
class APIHandler{
    func fetchData(url:URL,completion: @escaping(Result<Data, APIError>) -> Void){
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else{
                print("NoResponseError")
                return completion(.failure(.NoResponseError))
            }
            completion(.success(data))
        }.resume()
    }
}
// Response Handler
class ResponseHandler{
    func fetchModel(data:Data, completion: @escaping(Result<[CommentModel], APIError>) -> Void){
            // Response Handler
            let commonResponse = try? JSONDecoder().decode([CommentModel].self, from: data)
            if let newResponse = commonResponse {
                return completion(.success(newResponse))
            }
            else{
                print("DecodingError")
                return completion(.failure(.DecodingError))
            }
    }
}



























