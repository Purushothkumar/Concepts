//
//  CommentViewModel.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 18/07/24.
//

import Foundation

class CommentViewModel: ObservableObject {

    @Published var comments = [CommentModel]()

    // Fetch Comments
    func fetchComments(){
        CommonService().fetchRequest { result in
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
