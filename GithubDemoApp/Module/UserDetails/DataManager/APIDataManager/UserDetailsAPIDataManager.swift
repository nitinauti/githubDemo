//
//  UserDetailsAPIDataManager.swift
//  GithubDemoApp
//
//  Created by Nitin Auti on 02/08/20.
//  Copyright © 2020 Nitin Auti. All rights reserved.
//

import Foundation
import Alamofire

/// UserDetailsAPIDataManager implements the UserDetailsAPIDataManagerProtocol protocol, if data needs to be saved/retrieved from the server, all the implentation should be done here
class UserDetailsAPIDataManager:UserDetailsAPIDataManagerProtocol {
       
    /// Makes an getUserDetails 
    ///
    ///  - completionHandler: block of code to execute after response
    func getUserDetails(userName:String, completionHandler: @escaping (NSDictionary?, Error?) -> ()) {
          
        Alamofire.request(Constants.APIRoutes.getUserDetails.appending(userName), method:.get, parameters:nil, encoding:JSONEncoding.default, headers:nil).responseJSON { response in
                
            var responseDict: NSDictionary
            let responseKeys: [String] = ["status", "userDetailList"]
            let userDetail: UserDetails = UserDetails.init()

            switch response.result {

            case .success(let JSON):
                let userDetailsJSON: NSDictionary = JSON as! NSDictionary
                userDetail.login = userDetailsJSON.value(forKey: "login") as? String ?? ""
                userDetail.followers_url = userDetailsJSON.value(forKey: "followers_url") as? String ?? ""
                userDetail.location = userDetailsJSON.value(forKey: "location") as? String ?? ""
                userDetail.public_repos = userDetailsJSON.value(forKey: "public_repos") as? Int64 ?? 00
                userDetail.public_gists = userDetailsJSON.value(forKey: "public_gists") as? Int64  ?? 00
                userDetail.followers = userDetailsJSON.value(forKey: "followers") as? Int64 ?? 00
                userDetail.updated_at = userDetailsJSON.value(forKey: "updated_at") as? String ?? ""
                responseDict = NSDictionary.init(objects: [Constants.status.OK, userDetail], forKeys: responseKeys as [NSCopying])
                completionHandler(responseDict, nil)
         
            case .failure(let error):
                
                responseDict = NSDictionary.init(objects: [Constants.status.NOK, userDetail], forKeys: responseKeys as [NSCopying])
                completionHandler(responseDict, error)
             
             }
           }
        }
    }
    


