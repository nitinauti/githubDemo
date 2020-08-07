//
//  Constants.swift
//  GithubDemoApp
//
//  Created by Nitin Auti on 03/08/20.
//  Copyright © 2020 Nitin Auti. All rights reserved.
//

import Foundation

/// Constants used all over the application
struct Constants {
    
    /// Private Struct - Domains used in the application
    private struct domains {
       static let  runtime = BuildConfiguration.sharedInstance.runtime()
    }
    
    /// Rest Routes for One server
    struct APIRoutes {
        static let getProducts = Constants.server.baseURL +  "users"
        static let getSearchUserList = Constants.server.baseURL +  "search/users"
        static let getUserDetails = Constants.server.baseURL + "users/"
    }
    
    /// Server URL's
    struct server {
        static let baseURL = domains.runtime
    }
    
    /// Status constants
    struct status {
        static let OK = "OK"
        static let NOK = "NOK"
    }
    

}
