//
//  UserListListAPIDataManager.swift
//  MoovetShop
//
//  Created by Nitin Auti on 27/07/20.
//  Copyright © 2020 Nitin Auti. All rights reserved.
//

import Foundation
import Alamofire

/// UserListAPIDataManager implements the UserListAPIDataManagerProtocol protocol, if data needs to be saved/retrieved from the server, all the implentation should be done here
class UserListAPIDataManager:UserListAPIDataManagerProtocol {
   
       
    let networkingService = NetworkingService.sharedInstance
    
    /// Makes an removeAddressItemFromList against networkingService
    ///
    ///  - completionHandler: block of code to execute after networkingService response
    func getUserList(completionHandler: @escaping (NSDictionary?, Error?) -> ()) {
   
      Alamofire.request(Constants.APIRoutes.getProducts,method:.get,parameters:nil,encoding:JSONEncoding.default ,headers:nil).responseJSON { response in
             var products: [Product] = [Product]()
            
        var responseDict: NSDictionary
        let responseKeys: [String] = ["status", "userList"]
        switch response.result {

        case .success(let JSON):
            let productsJSON: [NSDictionary] = (JSON as! NSArray) as! [NSDictionary]
            for productJ: NSDictionary in productsJSON {
            let product: Product = Product.init()
            product.name = productJ.value(forKey: "login") as! String
            product.productId = productJ.value(forKey: "type") as! String
            products.append(product)
            }
            responseDict = NSDictionary.init(objects: [Constants.status.OK, products], forKeys: responseKeys as [NSCopying])
            completionHandler(responseDict, nil)
     
        case .failure(let error):
            responseDict = NSDictionary.init(objects: [Constants.status.NOK, products], forKeys: responseKeys as [NSCopying])
            completionHandler(responseDict, error)
         }
        }
       }
    
    /// Makes an removeAddressItemFromList against networkingService
    ///
    ///  - completionHandler: block of code to execute after networkingService response
    func getUserSearchList(pageNo: Int, searchQuery: String, completionHandler: @escaping (NSDictionary?, Error?) -> ()) {
        
        let url = Constants.APIRoutes.getSearchUserList + "?" + "q" + "=" + searchQuery + "&" + "page" + "=" + String(pageNo)
       
        Alamofire.request(url,method:.get,parameters:nil,encoding:JSONEncoding.default ,headers:nil).responseJSON { response in
                    
            var products: [Product] = [Product]()
            var responseDict: NSDictionary
            let responseKeys: [String] = ["status", "userList"]
            switch response.result {

            case .success(let JSON):
                 
                let productsJSON: [NSDictionary] = (((JSON as? NSDictionary ?? [:]).value(forKey:"items")) as? NSArray ?? []) as! [NSDictionary]
                for productJ: NSDictionary in productsJSON {
                let product: Product = Product.init()
                product.name = productJ.value(forKey: "login") as! String
                product.productId = productJ.value(forKey: "type") as! String
                products.append(product)
                }
                responseDict = NSDictionary.init(objects: [Constants.status.OK, products], forKeys: responseKeys as [NSCopying])
                completionHandler(responseDict, nil)
         
            case .failure(let error):
                responseDict = NSDictionary.init(objects: [Constants.status.NOK, products], forKeys: responseKeys as [NSCopying])
                completionHandler(responseDict, error)
             }
         }
      }
    
}
    

