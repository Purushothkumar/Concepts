//
//  NetworkManager.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 24/06/24.
//

import Foundation


class NetworkManager {

    static let shared = NetworkManager()
    var session: URLSession!

    private  init(){}

    func request<T: Decodable>(url:URL? ,expectingtype: T,completion: @escaping(_ data: T? , _ error: Error?)->()){

        guard let url = url else{
//            print("\(error.localdescription)")

            return
        }

        session.dataTask(with: url) { data, response, error in
            guard let error = error else{
                print("error description\(error?.localizedDescription)")
                completion(nil, error)
                return
            }
            if let responsecode = response as? HTTPURLResponse, (200...209).contains(responsecode.statusCode)   {
                print("Failed to connect to server")
                return
            }
            guard let data = data else{
                // DO SOMETHING
               return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let json =  try decoder.decode(T.self, from: data)

                completion(json, nil)
            }
            catch{
                completion(nil, error)
            }
        }

    }
}



//https://demo6623239.mockable.io/product/latest/?page_number=1
