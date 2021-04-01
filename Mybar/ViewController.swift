//
//  ViewController.swift
//  Mybar
//
//  Created by Alexis Piraux on 01/04/2021.
//

import UIKit

class HomeController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var filter: UIButton!
    var tb : [Cocktail]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        filter.layer.cornerRadius = 10
        filter.layer.borderWidth = 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Api.instance.GetCocktail { [self] (result) in
            switch result {
            case .success(let response):
                self.tb = response.drinks
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }

    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tb?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCell
        let row = indexPath.row
        cell.titleCocktail.text = tb?[row].strGlass
        return cell
    }


}

