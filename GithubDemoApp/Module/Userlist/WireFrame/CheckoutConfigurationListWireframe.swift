//
//  UserListListWireframe.swift
//  MoovetShop
//
//  Created by Nitin Auti on 27/07/20.
//  Copyright © 2020 Nitin Auti. All rights reserved.
//

import Foundation
import UIKit
class UserListWireframe: UserListWireframeProtocol {
  
    static func presentUserListView(fromView: AnyObject) {
        let view: UserListViewProtocol = UserListViewController.instantiate()
        let presenter: UserListPresenterProtocol  = UserListPresenter()
        let interactor: UserListInteractorProtocol = UserListInteractor()
        let APIDataManager: UserListAPIDataManagerProtocol = UserListAPIDataManager()
        let wireFrame: UserListWireframeProtocol = UserListWireframe()

        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.APIDataManager = APIDataManager

        let viewController = view as! UserListViewController
        NavigationHelper.setRootViewController(withViewController:(viewController as UIViewController))
    
    }
 
    func presentUserDetailScreen(userName:String){
          UserDetailsWireframe.presentUserDetailsView(fromView:UserDetailsViewController(),userName:userName)
      }
      
}
