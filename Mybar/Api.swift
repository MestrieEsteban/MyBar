//
//  ListData.swift
//  Contact
//
//  Created by Alexis Piraux on 26/03/2021.
//

import Foundation

enum ApiError: Error {
    case decoding
    case unknow
    
    var message : String {
        switch self {
        case .decoding:
            return "Decoding error"
        case .unknow:
            return "Unkonw error"
        }
    }
}

class Api {
    let baseUrl = "https://www.thecocktaildb.com/api/json/v1/1"
    let session = URLSession(configuration: .default)
    static let instance = Api()
    
    
    func GetCocktail(callback: @escaping (Result<Cocktails, ApiError>) -> Void )
    {
        guard let url = URL(string: "\(baseUrl)/search.php?f=a") else { return }
        session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                DispatchQueue.main.async {
                    do {
                        let users = try! JSONDecoder().decode(Cocktails.self, from: data)
                        callback(.success(users))
                    } catch{
                        callback(.failure(.decoding))
                    }
                }
            }
            else{
                callback(.failure(.decoding))
            }

        }.resume()
    }
}
