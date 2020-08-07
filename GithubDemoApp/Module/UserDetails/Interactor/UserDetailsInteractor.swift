//
//  UserDetailsInteractor.swift
//  GithubDemoApp
//
//  Created by Nitin Auti on 02/08/20.
//  Copyright © 2020 Nitin Auti. All rights reserved.
//

import Foundation
class UserDetailsInteractor: UserDetailsInteractorProtocol {
    
     // MARK: Variables
    var presenter: UserDetailsPresenterProtocol?
    var APIDataManager: UserDetailsAPIDataManagerProtocol?
    
    /// Makes the getUserDetails request and handles the response as needed
    ///
    /// - Parameters:
    ///   - AddressId: String with the AddressId
    func getUserDetails(userName:String) {
        APIDataManager?.getUserDetails(userName:userName, completionHandler: {responseObject,error in
        
        let status: String = responseObject?.value(forKey: "status") as! String

        switch(status){
        case Constants.status.OK:
            self.presenter?.fetchedUserDetailList(list: responseObject?.value(forKey:"userDetailList") as! UserDetails)
        case Constants.status.NOK: break
                
        default:
        print("default")
         }
      })
    }
}
