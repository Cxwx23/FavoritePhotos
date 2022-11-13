//
//  PhotoTableViewController.swift
//  FavoritePhotos
//
//  Created by Cole Warner on 11/10/22.
//

import UIKit

class PhotoTableViewController: UITableViewController {
    
    @IBOutlet var photoTableView: UITableView?
    
    let vm = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        vm.getPhotoData(from: Url.photoApi.rawValue, table: tableView)
    }
    
    @IBAction func didPressFavoriteButton(_ sender: Any) {
        performSegue(withIdentifier: Id.favoritesSegue.rawValue, sender: nil)
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.photos?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Id.photoCell.rawValue, for: indexPath) as! PhotoTableViewCell
        
        cell.setData(photo: vm.getDataForPhotoCell(row: indexPath.row), vm: vm)
        
        return cell
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
                
            case Id.detailSegue.rawValue:
                guard let detailVC = segue.destination as? PhotoDetailViewController,
                      let indexPath = tableView.indexPathForSelectedRow else { return }
                detailVC.photo = vm.photos?[indexPath.row]
                detailVC.vm = vm
                
            case Id.favoritesSegue.rawValue:
                guard let favoriteVC = segue.destination as? FavoriteTableViewController else { return }
                favoriteVC.favorites = vm.getFavorites()
                favoriteVC.vm = vm
                
            default: break
                
            }
        }
    }
}
