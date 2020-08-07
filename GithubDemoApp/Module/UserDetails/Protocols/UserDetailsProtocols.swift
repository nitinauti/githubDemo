//
//  UserDetailsProtocols.swift
//  GithubDemoApp
//
//  Created by Nitin Auti on 02/08/20.
//  Copyright © 2020 Nitin Auti. All rights reserved.
//

import Foundation
import UIKit

protocol UserDetailViewProtocol:class {
    var presenter: UserDetailsPresenterProtocol? { get set }
    
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
    func showUserDetailList(list:UserDetails)

}

protocol UserDetailsWireframeProtocol: class {
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
    static func presentUserDetailsView(fromView:AnyObject,userName:String)

}

protocol UserDetailsProtocols: class {
        
}
protocol UserDetailsPresenterProtocol: class {
    var view: UserDetailViewProtocol? { get set }
    var interactor: UserDetailsInteractorProtocol? { get set }
    var wireFrame: UserDetailsWireframeProtocol? { get set }

    /**
    * Add here your methods for communication VIEW -> PRESENTER  &&   INTERACTOR -> PRESENTER   &&     PRESENTER -> INTERACTOR
    */
    func getUserDetails(userName:String)
    func fetchedUserDetailList(list:UserDetails)

}
protocol UserDetailsInteractorProtocol: class {
    var presenter: UserDetailsPresenterProtocol? { get set }
    var APIDataManager: UserDetailsAPIDataManagerProtocol? { get set }
    
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
    func getUserDetails(userName:String)
}
protocol UserDetailsAPIDataManagerProtocol: class {
   
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
    func getUserDetails(userName:String ,completionHandler: @escaping (NSDictionary?, Error?) -> ())

    
}
protocol UserDetailsLocalDataManagerProtocol: class {
    
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
}
