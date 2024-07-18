//
//  CommentModel.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 18/07/24.
//

import Foundation

struct CommentModel:Codable,Identifiable {
    var postID: Int?
    var id: Int?
    var name: String?
    var email: String?
    var body: String?

    enum Codingkeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
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
