//
//  HomeController.swift
//  Mybar
//
//  Created by Alexis Piraux on 01/04/2021.
//

import UIKit

class HomeController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnIngredient: UIButton!
    @IBOutlet weak var btnCocktail: UIButton!
    @IBOutlet weak var btnName: UIButton!
    @IBOutlet weak var btnAlphabetique: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    var tb : [Cocktail]?
    var terms: String = "d"
    var type:String = "cocktail"
    var search:String = "letter"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        tableView.tableFooterView = UIView()
        btnIngredient.layer.cornerRadius = 10
        btnIngredient.layer.borderWidth = 1
        btnCocktail.layer.cornerRadius = 10
        btnCocktail.layer.borderWidth = 1
        btnName.layer.cornerRadius = 10
        btnName.layer.borderWidth = 1
        btnAlphabetique.layer.cornerRadius = 10
        btnAlphabetique.layer.borderWidth = 1
        load_api()
    }
    
    func load_api() {
        if terms != ""{
            Api.instance.GetState(type: type, search: search, terms: terms)
            Api.instance.GetJson{ [self] (result) in
                switch result {
                case .success(let response):
                        self.tb = response.drinks
                        self.tableView.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    @IBAction func actionCocktail(_ sender: Any) {
        self.type = "cocktail"
    }
    
    @IBAction func actionIngredient(_ sender: Any) {
        self.type = "ingredient"
    }
    
    @IBAction func btnName(_ sender: Any) {
        self.search = "name"
    }
    
    @IBAction func btnAlphabetique(_ sender: Any) {
        self.search = "letter"
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tb?.count ?? 0
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCell
        let cocktail = self.tb?[indexPath.row]
        cell.titleCocktail.text = cocktail?.strDrink
        
        let cocktailImageUrl = URL(string: (cocktail?.strDrinkThumb)!)!
        let cocktailImageDate = try? Data(contentsOf: cocktailImageUrl)
        cell.ImageCocktail.image = UIImage(data: cocktailImageDate!)
        return cell
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        print(type)
        self.terms = searchText
        load_api()
    }


}

