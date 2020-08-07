//
//  UserDetailsPresenter.swift
//  GithubDemoApp
//
//  Created by Nitin Auti on 02/08/20.
//  Copyright © 2020 Nitin Auti. All rights reserved.
//

import Foundation
import UIKit

class UserDetailsPresenter:UserDetailsPresenterProtocol{
    
    // MARK: Variables
    var view: UserDetailViewProtocol?
    var interactor: UserDetailsInteractorProtocol?
    var wireFrame: UserDetailsWireframeProtocol?
    
  
    /// called form presneter to intractor get user list
    func getUserDetails(userName:String) {
        interactor?.getUserDetails(userName:userName)
    }
    
   func fetchedUserDetailList(list:UserDetails) {
      self.view?.showUserDetailList(list:list)
    }
    
    
    
}
