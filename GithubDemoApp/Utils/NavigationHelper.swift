//
//  NavigationHelper.swift
//  GithubDemoApp
//
//
//  Created by Nitin Auti on 03/08/20.
//  Copyright © 2020 Nitin Auti. All rights reserved.
//

import Foundation
import UIKit

class NavigationHelper{

    static func setRootViewController(withViewController: UIViewController){
        let navigationController = UINavigationController(rootViewController: withViewController)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        appDelegate.window?.rootViewController = navigationController
        appDelegate.window?.makeKeyAndVisible()
    }
    
    static func pushViewController(viewController: UIViewController){
        let navigationController = UIApplication.shared.windows[0].rootViewController as! UINavigationController
        navigationController.pushViewController(viewController, animated: true)
    }
    
    static func singleBack(animated: Bool){
        let navigationController = UIApplication.shared.windows[0].rootViewController as! UINavigationController
        navigationController.popViewController(animated: animated)
    }
    
    static func popToRootViewController(animated: Bool){
        let navigationController = UIApplication.shared.windows[0].rootViewController as! UINavigationController
        navigationController.popToRootViewController(animated: animated)
    }
    
    static func presentViewController(viewController: UIViewController){
        let navigationController = UIApplication.shared.windows[0].rootViewController as! UINavigationController
        navigationController.present(viewController, animated: true, completion: {})
    }
    
}
