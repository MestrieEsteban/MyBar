//
//  customCell.swift
//  Mybar
//
//  Created by Alexis Piraux on 01/04/2021.
//

import UIKit

class CustomCell: UITableViewCell {

    
    @IBOutlet weak var ViewIngredient: UIView!
    @IBOutlet weak var titleCocktail: UILabel!
    @IBOutlet weak var ImageCocktail: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

