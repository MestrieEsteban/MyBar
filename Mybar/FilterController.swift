//
//  FilterController.swift
//  Mybar
//
//  Created by Alexis Piraux on 01/04/2021.
//

import UIKit

class FilterController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var filterTable: UITableView!
    
    var data = ["Filters", "Search", "search by name", "search by letter", "List letter", "A", "B", "C", "D", "E", "F", "G", "H", "U", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S",
                "T", "U", "V", "W", "X", "Y"  ]

    override func viewDidLoad() {
        super.viewDidLoad()
        filterTable.delegate = self
        filterTable.dataSource = self
        filterTable.tableHeaderView = UIView()
        filterTable.layer.borderColor =  UIColor.black.cgColor
        filterTable.layer.borderWidth =  1
        filterTable.layer.backgroundColor = UIColor.white.cgColor
        filterTable.layer.cornerRadius = 20

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        if row == 0 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "titleFilter", for: indexPath)

        return cell
        }
        
        else if row == 1 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filterCategory", for: indexPath)
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)]
        cell.textLabel?.attributedText =  NSMutableAttributedString(string: data[row], attributes:attrs)
        cell.textLabel?.textAlignment = NSTextAlignment.center
        return cell
        }
        
        else if row < 4 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filterSearch", for: indexPath)
        cell.textLabel?.attributedText =  NSMutableAttributedString(string: data[row])
        return cell
        }
        
        else if row < 5 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filterLetterCategory", for: indexPath)
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)]
        cell.textLabel?.attributedText =  NSMutableAttributedString(string: data[row], attributes:attrs)
        cell.textLabel?.textAlignment = NSTextAlignment.center
        return cell
        }
        
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "filterLetter", for: indexPath)
            cell.textLabel?.attributedText =  NSMutableAttributedString(string: data[row])
            return cell
        }
    }
    

}
