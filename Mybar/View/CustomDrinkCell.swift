//
//  CustomDrinkCell.swift
//  Mybar
//
//  Created by Alexis Piraux on 09/04/2021.
//

import UIKit

class CustomDrinkCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var images: UIImageView!
    
    func configureCocktail(with drink: Cocktail?)
    {
        title.text = drink?.strDrink
        if  drink?.strDrinkThumb != "" {
            guard let imageUrl:URL = URL(string: drink!.strDrinkThumb) else {
                return
        }
        images.fetchImage(from: imageUrl)
        }
    }
    

}
