//
//  DetailsDrinkController.swift
//  Mybar
//
//  Created by Alexis Piraux on 09/04/2021.
//

import UIKit

class DetailsDrinkController: UIViewController {
    
    @IBOutlet weak var titleDetails: UILabel!
    @IBOutlet weak var imageDetails: UIImageView!
    var cocktails : Cocktail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        load_data()
    
    }
    
    func load_data()
    {
        titleDetails.text = cocktails?.strDrink
        guard let imageUrl:URL = URL(string: cocktails!.strDrinkThumb) else {return}
        imageDetails.fetchImage(from: imageUrl)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
