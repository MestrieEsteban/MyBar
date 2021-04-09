//
//  HomeController.swift
//  Mybar
//
//  Created by Alexis Piraux on 01/04/2021.
//

import UIKit

class HomeController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var btnCocktail: UIButton!
    @IBOutlet weak var btnIngredient: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    var cocktails : [Cocktail?] = []
    var currentCocktails: [Cocktail?] = []
    var terms: String = ""
    var type:String = "cocktail"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        searchBar.delegate = self
        load_api(term: "a")
    }
    
    
    func load_api(term: String) {
        Api.instance.listCocktailsByLetter(term){(cocktails) in
            if let cocktails = cocktails {
                self.cocktails = cocktails.drinks
                self.currentCocktails = cocktails.drinks
                self.collectionView.reloadData()
            } else {
                print("Could not fetch cocktails")
            }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return currentCocktails.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomDrinkCell
        let cocktail = self.currentCocktails[indexPath.row]
        cell.configureCocktail(with: cocktail)
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        guard !searchText.isEmpty else {
            currentCocktails = cocktails
            collectionView.reloadData()
            return
        }
        currentCocktails = cocktails.filter({drink -> Bool in
            (drink?.strDrink.lowercased().contains(searchText.lowercased()))!
        })
        collectionView.reloadData()
    }
    
    
}

