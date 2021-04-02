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
    var terms:String = ""
    var urlParameters:String = ""
    static let instance = Api()
    
    
    func GetState(type: String, search:String, terms:String)
    {
        if (type == "cocktail" && search == "letter" && terms.count == 1)
        {
            return self.urlParameters = "/search.php?f=\(terms.lowercased())"
        }
        
        else if(type == "cocktail" && search == "name" && terms.count >= 1)
        {
            return self.urlParameters = "/search.php?s=\(terms.lowercased())"
        }
        
        else if(type == "ingredient" && terms.count >= 1)
        {
            return self.urlParameters = "/search.php?i=\(terms.lowercased())"
        }
    }
    
    
    func GetJsonCocktail(callback: @escaping (Result<Cocktails, ApiError>) -> Void )
    {
        guard let url = URL(string: "\(baseUrl)\(urlParameters)") else { return }
        print (url)
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
    
    func GetJsonIngredient(callback: @escaping (Result<Ingredients, ApiError>) -> Void )
    {
        guard let url = URL(string: "\(baseUrl)\(urlParameters)") else { return }
        print (url)
        session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                DispatchQueue.main.async {
                    do {
                        let users = try! JSONDecoder().decode(Ingredients.self, from: data)
                        callback(.success(users))
                        print(users)
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
