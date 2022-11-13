//
//  FavoriteTableViewController.swift
//  FavoritePhotos
//
//  Created by Cole Warner on 11/10/22.
//

import UIKit

class FavoriteTableViewController: UITableViewController {
    
    @IBOutlet var favoriteTableView: UITableView?
    var favorites: [Favorite]?
    var vm = ViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Id.favoriteCell.rawValue, for: indexPath) as! FavoriteTableViewCell

        cell.setData(photo: vm.getDataForFavoriteCell(row: indexPath.row), vm: vm)

        return cell
    }
    
}
