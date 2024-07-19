//
//  CommonService.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 18/07/24.
//

import Foundation


protocol CommonServiceDelegate{
    func fetchComments(completion: @escaping(Result<[CommentModel], APIError>) -> Void)
    func fetchUsers(completion: @escaping(Result<[UserModel], APIError>) -> Void)
}


class CommonService: CommonServiceDelegate{

    func fetchComments(completion: @escaping(Result<[CommentModel], APIError>) -> Void){
        // URL
        guard let url = URL(string: APIURL.fetchComments) else{
            print("BadURLError")
            return completion(.failure(.BadURLError))
        }
        // API Common Service
//        NetworkManager().fetchRequest(completion:completion)
        NetworkManager().fetchRequest(type:[CommentModel].self,url: url, completion: completion)
    }

    func fetchUsers(completion: @escaping(Result<[UserModel], APIError>) -> Void){
        // URL
        guard let url = URL(string: APIURL.fetchUsers) else{
            print("BadURLError")
            return completion(.failure(.BadURLError))
        }
        // API Common Service
//        NetworkManager().fetchUserRequest(completion:completion)
        NetworkManager().fetchRequest(type:[UserModel].self,url: url, completion: completion)
    }
}



//protocol NetworkProtocol: ServiceProtocol, DataBaseProtocol{
//
//}
//
//protocol ServiceProtocol{
//    func getPost(completion: @escaping(Result<[UserModel],DemoErrorModel>) -> Void)
//}
//protocol DataBaseProtocol{
//    func getComment(completion: @escaping(Result<[CommentModel],DemoErrorModel>) -> Void)
//}
//
//class CommonService: NetworkProtocol{
//
//    func getComment(completion: @escaping(Result<[CommentModel],DemoErrorModel>) -> Void){
//        guard let url = URL(string: "https://demo1732301.mockable.io/SOLID") else {
//            return completion(.failure(.BadURL))
//        }
////        NetworkManager().getComment(completion:completion)
//        NetworkManager().fetchRequest(type: [CommentModel].self, url: url, completion:completion)
//    }
//    func getPost(completion: @escaping(Result<[UserModel],DemoErrorModel>) -> Void){
//        guard let url = URL(string: "https://demo1732301.mockable.io/SOLID") else {
//            return completion(.failure(.BadURL))  
//        }
////        NetworkManager().getComment(completion:completion)
//        NetworkManager().fetchRequest(type: [UserModel].self, url: url, completion:completion)
//
//    }
//
//}
//
