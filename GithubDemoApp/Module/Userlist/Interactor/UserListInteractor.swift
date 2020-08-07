//
//  UserListListInteractor.swift
//  MoovetShop
//
//  Created by Nitin Auti on 27/07/20.
//  Copyright © 2020 Nitin Auti. All rights reserved.
//

import Foundation
class UserListInteractor: UserListInteractorProtocol {
  
     // MARK: Variables
    var presenter: UserListPresenterProtocol?
    var APIDataManager: UserListAPIDataManagerProtocol?
    
    /// Makes the getUserList request and handles the response as needed
    func getUserList() {
        APIDataManager?.getUserList( completionHandler: {responseObject,error in
        let status: String = responseObject?.value(forKey: "status") as! String

        switch(status){
        case Constants.status.OK:
            self.presenter?.fetchedUserList(list: responseObject?.value(forKey:"userList") as! [Product])
        case Constants.status.NOK: break
       
        default:
        print("default")
         }
      })
    }
   
 
    /// Makes the getUserList request and handles the response as needed
    ///
    /// - Parameters:
    ///  - pageNo: Int with the pageNo
    ///  - searchQuery: String with the searchQuery
    func getUserSearchList(pageNo: Int, searchQuery: String) {
        APIDataManager?.getUserSearchList(pageNo: pageNo,searchQuery: searchQuery, completionHandler: {responseObject,error in
               let status: String = responseObject?.value(forKey: "status") as! String

               switch(status){
               case Constants.status.OK:
                   self.presenter?.fetchedUserList(list: responseObject?.value(forKey:"userList") as! [Product])
               case Constants.status.NOK: break
              
               default:
               print("default")
                }
           })
      }
          
}
