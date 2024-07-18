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
        aPIHandler.fetchReponse(url: url) { result in
            switch result {
            case .success(let data):
                    print(data)
                self.responseHandler.fetchRequest(data: data) { decodedReponse in
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
    func fetchReponse(url:URL,completion: @escaping(Result<Data, APIError>) -> Void){
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
    func fetchRequest(data:Data, completion: @escaping(Result<[CommentModel], APIError>) -> Void){
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



























//enum DemoErrorModel: Error{
//
//    case BadURL
//    case NoResponse
//    case DecodingError
//}
//
//
//class NetworkManager{
//    let aPIHandler: APIHandler
//    let responseHandler: ResponseHandler
//
//    init(aPIHandler: APIHandler = APIHandler(), responseHandler: ResponseHandler = ResponseHandler()) {
//        self.aPIHandler = aPIHandler
//        self.responseHandler = responseHandler
//    }
//
//    func fetchRequest<T: Codable >(type: T.Type, url: URL,  completion: @escaping(Result<T,DemoErrorModel>) -> Void){
//         aPIHandler.fetchData(url: url) { result in
//            switch result{
//            case .success(let data):
//                print(data)
//                self.responseHandler.fetchModel (type: type, data: data) { decodeReponse in
//                    switch decodeReponse {
//                    case .success(let model):
//                        completion(.success(model))
//                    case .failure(let error):
//                        completion(.failure(error))
//                    }
//                }
//            case .failure(let error):
//                print(error)
//                completion(.failure(.NoResponse))
//            }
//        }
//    }
//}
//
//class APIHandler{
//    func fetchData(url: URL, completion: @escaping(Result<Data,DemoErrorModel>) -> Void){
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data, error == nil else{
//                return completion(.failure(.NoResponse))
//            }
//            completion(.success(data))
//        }.resume()
//
//    }
//}
//
//class ResponseHandler {
//
//    func fetchModel<T: Codable>(type: T.Type, data:Data, completion: @escaping(Result<T,DemoErrorModel>) -> Void){
//
//            let response = try? JSONDecoder().decode(T.self, from: data)
//            if let response = response{
//                return completion(.success(response))
//            }
//            else{
//                return completion(.failure(.DecodingError))
//            }
//    }
//}


//https://demo6623239.mockable.io/product/latest/?page_number=1
