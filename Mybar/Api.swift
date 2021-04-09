//
//  ListData.swift
//  Contact
//
//  Created by Alexis Piraux on 26/03/2021.
//

import Foundation

class Api {
    let baseUrl = "https://www.thecocktaildb.com/api/json/v1/1"
    let session = URLSession(configuration: .default)
    var terms:String = ""
    var urlParameters:String = ""
    static let instance = Api()
    
    func listCocktailsByLetter(_ letter: String, completion: @escaping (Cocktails?) -> Void) {
        guard let url = URL(string: "\(baseUrl)/search.php?f=\(letter)") else {
            completion(nil)
            return
        }
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let cocktails = try decoder.decode(Cocktails.self, from: data)
                    DispatchQueue.main.async { completion(cocktails) }
                } catch (let error) {
                    print(error)
                    DispatchQueue.main.async { completion(nil) }
                    print("Deserialisation failed")
                }
            } else {
                DispatchQueue.main.async { completion(nil) }
                print("No data")
            }
        }

        task.resume()
    }
    
}
