//
//  Ingredient.swift
//  Mybar
//
//  Created by Alexis Piraux on 02/04/2021.
//

import Foundation
struct Ingredients: Decodable {
let ingredients: [Ingredient]
}

struct Ingredient: Decodable {
    let strIngredient:String
}
