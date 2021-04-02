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
    var tb2 : [ingredient]?
    var terms: String = ""
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
            if type == "ingredient"
            {
                Api.instance.GetJsonIngredient{ [self] (result) in
                    switch result {
                    case .success(let response):
                            self.tb2 = response.ingredients
                            self.tableView.reloadData()
                    case .failure(let error):
                        print(error)
                    }
                }
            }
            else if type == "cocktail"
            {
                Api.instance.GetJsonCocktail{ [self] (result) in
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
    }
    
    @IBAction func actionCocktail(_ sender: Any) {
        self.type = "cocktail"
        
        if(self.btnAlphabetique.isHidden == true)
        {
            self.btnAlphabetique.isHidden = false
        }
    }
    
    @IBAction func actionIngredient(_ sender: Any) {
        self.type = "ingredient"
        
        if(type == "ingredient")
        {
            self.btnAlphabetique.isHidden = true
        }
    }
    
    @IBAction func btnName(_ sender: Any) {
        self.search = "name"
    }
    
    @IBAction func btnAlphabetique(_ sender: Any) {
        self.search = "letter"
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if type == "cocktail"
        {
            return tb?.count ?? 0
        }
        else if (type == "ingredient"){
            return tb2?.count ?? 0
        }
        
        return 0
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCell

        if type == "cocktail"
        {   let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCell
            let cocktail = self.tb?[indexPath.row]
            cell.titleCocktail.text = cocktail?.strDrink
            
            let cocktailImageUrl = URL(string: (cocktail?.strDrinkThumb)!)!
            let cocktailImageDate = try? Data(contentsOf: cocktailImageUrl)
            cell.ImageCocktail.image = UIImage(data: cocktailImageDate!)
            return cell
        }
        else if type == "ingredient" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCell
            print(tb2)
            let ingredient = self.tb2?[indexPath.row]
            cell.titleCocktail.text = ingredient?.strIngredient
            return cell
        }
    
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        print(type)
        self.terms = searchText
        load_api()
    }


}

