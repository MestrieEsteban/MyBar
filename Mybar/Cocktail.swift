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
    let strGlass:String
    let strDrinkThumb:String
}
