//
//  UserDetails.swift
//  GithubDemoApp
//
//  Created by Nitin Auti on 03/08/20.
//  Copyright © 2020 Nitin Auti. All rights reserved.
//

import Foundation


class UserDetails : NSObject, NSCoding {
  
    // MARK: Variables
    
    /// login
    var login: String = ""
    
    /// followers_url
    var followers_url: String = ""
    
    /// location
    var location: String = ""
    
    /// name
    var name: String = ""
    
    /// public_repos
    var public_repos: Int64 = 00
    
    /// public_gists
    var public_gists: Int64 = 00
    
   /// followers
    var followers: Int64 = 00
    
    
    ///updated_at
    var updated_at: String = ""
    
    
    //MARK: Initializers
    /// Base Initializer
    override init() {
        super.init()
    }
    
    /// Full Initializer, receives all parameters
    ///
    /// - Parameters:
    ///   - productId: Product Id
    ///   - name: Product Name
    init(login: String, followers_url: String,location:String,name:String,public_repos:Int64,public_gists:Int64,followers:Int64,updated_at:String) {
        super.init()
        self.login = login
        self.followers_url = followers_url
        self.location = location
        self.name = name
        self.public_repos = public_repos
        self.public_gists = public_gists
        self.followers = followers
        self.updated_at = updated_at
    }
    //MARK: NSCoding
    
    /// NSCoding Initializer
    ///
    /// - Parameters:
    ///   - coder: NSCoder instance
    required init?(coder aDecoder: NSCoder) {
        self.login = aDecoder.decodeObject(forKey: "login") as! String
        self.followers_url = aDecoder.decodeObject(forKey: "followers_url") as! String
        self.location = aDecoder.decodeObject(forKey: "location") as! String
        self.name = aDecoder.decodeObject(forKey: "name") as! String
        self.public_repos = aDecoder.decodeObject(forKey: "public_repos") as! Int64
        self.public_gists = aDecoder.decodeObject(forKey: "public_gists") as! Int64
        self.followers = aDecoder.decodeObject(forKey: "followers") as! Int64
        self.updated_at = aDecoder.decodeObject(forKey: "updated_at") as! String
    }
    
    /// NSCoding Method
    ///
    /// - Parameter aCoder: NSCoder instance
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.login, forKey: "login")
        aCoder.encode(self.followers_url, forKey: "followers_url")
        aCoder.encode(self.location, forKey: "location")
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.public_repos, forKey: "public_repos")
        aCoder.encode(self.public_gists, forKey: "public_gists")
        aCoder.encode(self.followers, forKey: "followers")
        aCoder.encode(self.updated_at, forKey: "updated_at")
    }
}
