//
//  userList.swift
//  GithubDemoApp
//
//  Created by Nitin Auti on 03/08/20.
//  Copyright © 2020 Nitin Auti. All rights reserved.
//

import Foundation

/// Precheckout data struct, holds the card and shipping address of the user
/// Product Object, handles the product basic properties

class Product : NSObject, NSCoding {
    // MARK: Variables
    
    /// Product identifier
    var productId: String = ""
    
    /// Product name
    var name: String = ""
    
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
    init(productId: String, name: String) {
        super.init()
        self.productId = productId
        self.name = name
    }
    //MARK: NSCoding
    
    /// NSCoding Initializer
    ///
    /// - Parameters:
    ///   - coder: NSCoder instance
    required init?(coder aDecoder: NSCoder) {
        if let productId = aDecoder.decodeObject(forKey:"productId"){
            self.productId = productId as! String
            self.name = aDecoder.decodeObject(forKey: "name") as! String
        }
    }
    
    /// NSCoding Method
    ///
    /// - Parameter aCoder: NSCoder instance
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.productId, forKey: "productId")
        aCoder.encode(self.name, forKey: "name")
    }
}
