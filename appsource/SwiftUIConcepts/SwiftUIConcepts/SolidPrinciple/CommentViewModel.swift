//
//  CommentViewModel.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 18/07/24.
//

import Foundation
import SwiftUI

class CommentViewModel: ObservableObject {

    @Published var comments = [CommentModel]()
    @Published var users = [UserModel]()
    @AppStorage("isConnected") var isConnected: Bool?

//    var isConnected : Bool?

    var serviceHandler: CommonServiceDelegate
    var databaseHandler: CommentsDelegate
//    var databaseHandlers = String

    init(serviceHandler: CommonServiceDelegate = CommonService(), databaseHandler: CommentsDelegate = DataBaseHandler()){
        self.serviceHandler = serviceHandler
        self.databaseHandler = databaseHandler
    }

    private func toggleIsConnected() -> Bool {
        if let isConnected = isConnected {
            self.isConnected = !isConnected
        } else {
            self.isConnected = true
        }
        return self.isConnected ?? false
    }

//    private func toggleIsConnected() -> Bool {
//        return isConnected ?? false
//    }


    // Fetch Comments
    func fetchComments(){
        if toggleIsConnected(){
            serviceHandler.fetchComments { result in
                DispatchQueue.main.async {
                    switch result{
                    case .success(let comments):
                        print("new data fetched")
                        //returns Comments data
                        self.comments = comments
                    case .failure(let error):
                        print("Commonservice Error")
                        print(error)
                    }
                }
            }
        }
        else{
            databaseHandler.fetchComments { result in
                DispatchQueue.main.async {
                    switch result{
                    case .success(let comments):
                        print("new data fetched")
                        //returns Comments data
                        self.comments = comments
                    case .failure(let error):
                        print("Commonservice Error")
                        print(error)
                    }
                }
            }

        }

    }
    // Fetch Users
    func fetchUsers(){
        CommonService().fetchUsers { result in
            DispatchQueue.main.async {
                switch result{
                case .success(let users):
                    print("new data fetched")
                    //returns Comments data
                    self.users = users
                case .failure(let error):
                    print("Commonservice Error")
                    print(error)
                }
            }
        }
    }
}










//class CommentViewModel: ObservableObject {
//
//    let commonServiceHandler:ServiceProtocol
//    let dataBaseHandler:ServiceProtocol
//
//    init(commonServiceHandler: ServiceProtocol = CommonService(), dataBaseHandler: ServiceProtocol = DataBaseHandler()) {
//        self.commonServiceHandler =  commonServiceHandler
//        self.dataBaseHandler = dataBaseHandler
//        self.comments = comments
//        self.users = users
//    }
//
//    @Published var comments = [CommentModel]()
//    @Published var users = [UserModel]()
//
//    private func isConnected() -> Bool {
//        return false
//    }
//
//    func fetchComment(){
//        if (isConnected()){
//            commonServiceHandler.getComment{ result in
//                DispatchQueue.main.async {
//                    switch result{
//                    case .success(let comments):
//                        self.comments = comments
//                    case .failure(let error):
//                        print(error)
//
//                    }
//                }
//            }
//        } else {
//            dataBaseHandler.getComment{ result in
//                DispatchQueue.main.async {
//                    switch result{
//                    case .success(let comments):
//                        self.comments = comments
//                    case .failure(let error):
//                        print(error)
//                    }
//                }
//            }
//        }
//    }
//
//    func fetchPost(){
//        CommonService().getPost{ result in
//            DispatchQueue.main.async {
//                switch result{
//                case .success(let users):
//                    self.users = users
//                case .failure(let error):
//                    print(error)
//
//                }
//            }
//
//        }
//    }
//
//}




