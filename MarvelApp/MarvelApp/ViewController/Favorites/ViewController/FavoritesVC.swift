//
//  FavoritesVC.swift
//  MarvelApp
//
//  Created by Asit Aslan on 31.01.2022.
//  Copyright © 2022 Asit Aslan. All rights reserved.
//

import UIKit

class FavoritesVC: UIViewController {

    @IBOutlet weak var favoritesTableView: UITableView!
    var favorites = Constants.favorites
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favorites = Constants.favorites
        favoritesTableView.reloadData()

    }
    
    private func setupController(){
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
    }

}
extension FavoritesVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesTableCell") as? FavoritesTableCell else {
            return UITableViewCell()
        }
        cell.item = favorites[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        DetailViewController.push(from: self, id: favorites[indexPath.row].charactersResult.id ?? 0)
    }
    
    
}
