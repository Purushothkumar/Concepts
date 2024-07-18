//
//  UserModel.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 18/07/24.
//

import Foundation

struct UserModel:Codable,Identifiable {

    var name: String?
    var email: String?
    var id: Int?

    enum Codingkeys: String, CodingKey {
        case name, email , id
    }
}

/*
 [{
     "postId": 1,
     "id": 1,
     "name": "id labore ex et quam laborum",
     "email": "Eliseo@gardner.biz",
     "body": "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"
   }]
 */
