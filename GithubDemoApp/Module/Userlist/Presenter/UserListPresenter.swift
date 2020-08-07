//
//  UserListListPresenter.swift
//  MoovetShop
//
//  Created by Nitin Auti on 27/07/20.
//  Copyright © 2020 Nitin Auti. All rights reserved.
//

import Foundation
import UIKit

class UserListPresenter:UserListPresenterProtocol{
    
    // MARK: Variables
    var view: UserListViewProtocol?
    var interactor: UserListInteractorProtocol?
    var wireFrame: UserListWireframeProtocol?
    
  
    /// called form presneter to intractor get user list
    func getUserList() {
        interactor?.getUserList()
    }
    
   func fetchedUserList(list: [Product]) {
      self.view?.showUserList(list:list)
    }
    
    func presentUserDetailScreen(userName:String){
        wireFrame?.presentUserDetailScreen(userName:userName)
    }
   
    func getUserSearchList(pageNo:Int,searchQuery:String){
        interactor?.getUserSearchList(pageNo: pageNo, searchQuery: searchQuery)
    }
    
}
