//
//  BuildConfiguration.swift
//  GithubDemoApp
//
//  Created by Nitin Auti on 02/08/20.
//  Copyright © 2020 Nitin Auti. All rights reserved.
//

import Foundation

/// BuildConfiguration handles the configuration taken from a Plist, that plist is loaded depending of the selected scheme
class BuildConfiguration: NSObject {
    // MARK: Variables
    
    /// Singleton instance
    static let sharedInstance = BuildConfiguration()
    
    /// Configuration taken from the plist
    var configs: NSDictionary!
    
    //MARK: Initializers
    
    /// Base initializer, loads the corresponding Plist to the configs var
    override init() {
        let currentConfiguration = Bundle.main.object(forInfoDictionaryKey: "Config") as! String
        let path = Bundle.main.path(forResource: currentConfiguration, ofType: "plist")!
        configs = NSDictionary(contentsOfFile: path)
    }
}

// MARK: - BuildConfiguration Extension
extension BuildConfiguration {
    
    /// Returns the environment name
    ///
    /// - Returns: String environment name
    func environmentName() -> String {
        return configs.object(forKey: "environmentName") as! String
    }
    
    
    /// Returns the server runtime url
    ///
    /// - Returns: String runtime server url
    func runtime() -> String {
        return configs.object(forKey: "runtime") as! String
    }
    
    
   
}
