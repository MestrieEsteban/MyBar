//
//  Cocktail.swift
//  Mybar
//
//  Created by Alexis Piraux on 01/04/2021.
//

import Foundation

struct Cocktails: Decodable {
let drinks: [Cocktail]
}

struct Cocktail: Decodable {
    let idDrink: String
    let strDrink: String
    let strCategory: String
    let strGlass: String
    let strDrinkThumb: String
    let strInstructions: String
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    var ingredients: [String] {
        var array: [String] = []
        
        if let i = strIngredient1 { array.append(i) }
        if let i = strIngredient2 { array.append(i) }
        if let i = strIngredient3 { array.append(i) }
        if let i = strIngredient4 { array.append(i) }
        if let i = strIngredient5 { array.append(i) }
        if let i = strIngredient6 { array.append(i) }
        if let i = strIngredient7 { array.append(i) }
        if let i = strIngredient8 { array.append(i) }
        if let i = strIngredient9 { array.append(i) }
        if let i = strIngredient10 { array.append(i) }
        if let i = strIngredient11 { array.append(i) }
        if let i = strIngredient12 { array.append(i) }
        if let i = strIngredient13 { array.append(i) }
        if let i = strIngredient14 { array.append(i) }
        if let i = strIngredient15 { array.append(i) }
        
        return array
    }
}
