//
//  UserListListProtocols.swift
//  MoovetShop
//
//  Created by Nitin Auti on 27/07/20.
//  Copyright © 2020 Nitin Auti. All rights reserved.
//

import Foundation
import UIKit

protocol UserListViewProtocol:class {
    var presenter: UserListPresenterProtocol? { get set }
    
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
    func showUserList(list: [Product])
    func getUserSearchList(pageNo:Int,searchQuery:String)

}

protocol UserListWireframeProtocol: class {
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
    static func presentUserListView(fromView:AnyObject)
    func presentUserDetailScreen(userName:String)
}

protocol UserListProtocols: class {
        
}
protocol UserListPresenterProtocol: class {
    var view: UserListViewProtocol? { get set }
    var interactor: UserListInteractorProtocol? { get set }
    var wireFrame: UserListWireframeProtocol? { get set }

    /**
    * Add here your methods for communication VIEW -> PRESENTER  &&   INTERACTOR -> PRESENTER   &&     PRESENTER -> INTERACTOR
    */
    func getUserList()
    func fetchedUserList(list:[Product])
    func presentUserDetailScreen(userName:String)
    func getUserSearchList(pageNo:Int,searchQuery:String)

}
protocol UserListInteractorProtocol: class {
    var presenter: UserListPresenterProtocol? { get set }
    var APIDataManager: UserListAPIDataManagerProtocol? { get set }
    
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
     func getUserList()
     func getUserSearchList(pageNo:Int,searchQuery:String)
}
protocol UserListAPIDataManagerProtocol: class {
   
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
    func getUserList(completionHandler: @escaping (NSDictionary?, Error?) -> ())

    func getUserSearchList(pageNo:Int,searchQuery:String,completionHandler: @escaping (NSDictionary?, Error?) -> ())
}
protocol UserListLocalDataManagerProtocol: class {
    
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
}
