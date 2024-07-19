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

    func fetchRequest<T:Codable>(type:T.Type,url:URL,completion: @escaping(Result<T, APIError>) -> Void){
        // API Handler
        aPIHandler.fetchData(url: url) { result in
            switch result {
            case .success(let data):
                print(data)
                // Reponse Handler
                self.responseHandler.fetchModel(type: type , data: data) { decodedReponse in
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
//    func fetchUserRequest(completion: @escaping(Result<[UserModel], APIError>) -> Void){
//        // URL
//        guard let url = URL(string: APIURL.fetchUsers) else{
//            print("BadURLError")
//            return completion(.failure(.BadURLError))
//        }
//        // API Handler
//        aPIHandler.fetchUserData(url: url) { result in
//            switch result {
//            case .success(let data):
//                print(data)
//                // Reponse Handler
//                self.responseHandler.fetchUserModel(data: data) { decodedReponse in
//                    switch decodedReponse {
//                    case .success(let model):
//                        completion(.success(model))
//                    case .failure(let error):
//                        completion(.failure(error))
//                    }
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
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
//    func fetchUserData(url:URL,completion: @escaping(Result<Data, APIError>) -> Void){
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data, error == nil else{
//                print("NoResponseError")
//                return completion(.failure(.NoResponseError))
//            }
//            completion(.success(data))
//        }.resume()
//    }
}
// Response Handler
class ResponseHandler{
    func fetchModel<T:Codable>(type:T.Type,data:Data, completion: @escaping(Result<T, APIError>) -> Void){
        // Response Handler
        let commonResponse = try? JSONDecoder().decode(T.self, from: data)
        if let newResponse = commonResponse {
            return completion(.success(newResponse))
        }
        else{
            print("DecodingError")
            return completion(.failure(.DecodingError))
        }
    }
//    func fetchUserModel(data:Data, completion: @escaping(Result<[UserModel], APIError>) -> Void){
//        // Response Handler
//        let commonResponse = try? JSONDecoder().decode([UserModel].self, from: data)
//        if let newResponse = commonResponse {
//            return completion(.success(newResponse))
//        }
//        else{
//            print("DecodingError")
//            return completion(.failure(.DecodingError))
//        }
//    }
}



























