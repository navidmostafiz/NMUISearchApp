//
//  ViewController.swift
//  NMUISearchApp
//
//  Created by Navid on 4/10/20.
//  Copyright © 2020 UnitedStar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let nameArray = ["Navid", "Nahid", "Nafees", "Nafis", "Nahin"]
    var filteredArray:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        filteredArray = nameArray
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "arrayCell", for: indexPath)
        cell.textLabel?.text = filteredArray[indexPath.row]
        return cell
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredArray = nameArray
        
        if searchText.isEmpty == false {
            filteredArray = nameArray.filter({ $0.contains(searchText)})
        }
        
        tableView.reloadData()
    }
    
    
}
