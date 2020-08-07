//
//  NetworkingService.swift
//  GithubDemoApp
//
//  Created by Nitin Auti on 03/08/20.
//  Copyright © 2020 Nitin Auti. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

struct requestModel {
       var RequestUrl: String
       var method: Alamofire.HTTPMethod
       var parameters: [String: Any]?
       var headers: HTTPHeaders
}
class NetworkingService: NSObject {

  static let sharedInstance = NetworkingService()

/// api calling request using alamofire
func request(RequestModule:requestModel, success: @escaping ((_ responseObject: AnyObject?) -> Void), failure: @escaping ((_ error: NSError?) -> Void)) {
      
        Alamofire.request(RequestModule.RequestUrl,method:RequestModule.method,parameters: RequestModule.parameters,encoding:JSONEncoding.default ,headers:RequestModule.headers).responseJSON { response in
             
              let statusCode = response.response?.statusCode
             
              print("statusCode: \(statusCode ?? 200)")
              print("API request: \(response.request as Any)")
              print("API params: \(RequestModule.parameters  as AnyObject)")
              print("API response: \(response.value  as AnyObject)")
               
             switch response.result {
                 case .success(_):
                            success(response.value as AnyObject?)
                           
                 case .failure(_):
                        if (!Connectivity.isConnectedToInternet){
                             let userInfo: [AnyHashable : Any] = [
                                    "message" : "Please check your internet connection"
                                 ]
                             let error =  NSError(domain:"", code:URLError.notConnectedToInternet.rawValue, userInfo:userInfo as? [String : Any])
                             failure(error)
                        }else{
                            let userInfo: [AnyHashable : Any] = [
                                   "message" : "There was an error. Please try again later"
                                ]
                            let error =  NSError(domain:"", code:URLError.notConnectedToInternet.rawValue, userInfo:userInfo as? [String : Any])
                            failure(error)
                        }
                  }
           }
    }

/// sendding common header parameter from here
func headers()->HTTPHeaders{
            return [
                "Content-Type": "application/json",
              ] as HTTPHeaders
          }
// checking internet connectivity
class Connectivity {
        class var isConnectedToInternet:Bool {
            return NetworkReachabilityManager()!.isReachable
        }
    }

}
