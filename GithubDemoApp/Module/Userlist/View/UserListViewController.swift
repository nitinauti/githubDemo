//
//  UserListViewController.swift
//  MoovetShop
//
//  Created by Nitin Auti on 27/07/20.
//  Copyright © 2020 Nitin Auti. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView

class UserListViewController:BaseViewContoller, UserListViewProtocol,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate{
      
    // MARK: - Variable
    var presenter: UserListPresenterProtocol?
    @IBOutlet weak var UserListTableView :UITableView!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet  var parentView: UIView!
    fileprivate var itemsList: [Product] = []
    var postion : Int = 400
    let pageSize : Int = 10
    var totalEnteries = Int64()
    var page = 1
    
    
    
/// Overwritten method from UIVIewController, it calls a method to setShadowView
    override func viewDidLoad() {
        super.viewDidLoad()
        self.UserListTableView.register(UINib(nibName:"UserListTableViewCell", bundle:nil), forCellReuseIdentifier:"UserListTableViewCell")
        self.title = "User List"
        self.startAnimation()
        self.getUserList()
    }

    func getUserList(){
        presenter?.getUserList()
    }
    
    func getUserSearchList(pageNo:Int,searchQuery:String){
        self.startAnimation()
        presenter?.getUserSearchList(pageNo:pageNo, searchQuery:searchQuery)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        let searchBarStyle = searchBar.value(forKey: "searchField") as? UITextField
        searchBarStyle?.clearButtonMode = .never
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.getUserList()
        searchBar.text = nil
        searchBar.resignFirstResponder()
        UserListTableView.resignFirstResponder()
        UserListTableView.reloadData()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.itemsList = []
        self.getUserSearchList(pageNo: 1,searchQuery:searchBar.text ?? "")
    }

    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        if searchText.count == 0 {
        self.getUserList()
        }
    }
    
   func showUserList(list: [Product]) {
        self.stopAnimatig()
        self.itemsList = list
        self.UserListTableView.reloadData()
    }

    /// Static method will initialize the view
    ///
    /// - Returns: UserListViewController instance to be presented
    static func instantiate() -> UserListViewProtocol{
         return UIStoryboard(name: "UserListViewController", bundle: nil).instantiateViewController(withIdentifier: "UserListView") as! UserListViewController
        }
    }

extension UserListViewController {

    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemsList.count
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UserListTableViewCell()
        cell = UserListTableView.dequeueReusableCell(withIdentifier:"UserListTableViewCell", for:indexPath) as! UserListTableViewCell
        
        let Product = self.itemsList[indexPath.row]
        cell.userName.text = Product.name
        return cell
      }
    
    func  tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
            return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let item = self.itemsList[indexPath.row]
        presenter?.presentUserDetailScreen(userName:item.name)
    }
    
}



