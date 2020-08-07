//
//  UserDetailsViewController.swift
//  GithubDemoApp
//
//  Created by Nitin Auti on 02/08/20.
//  Copyright © 2020 Nitin Auti. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView

class UserDetailsViewController:BaseViewContoller, UserDetailViewProtocol{
   
    var presenter: UserDetailsPresenterProtocol?
    @IBOutlet weak var login:UILabel!
    @IBOutlet weak var followers_url:UILabel!
    @IBOutlet weak var location:UILabel!
    @IBOutlet weak var name:UILabel!
    @IBOutlet weak var public_repos:UILabel!
    @IBOutlet weak var public_gists:UILabel!
    @IBOutlet weak var followers:UILabel!
    @IBOutlet weak var updated_at:UILabel!


    var userName : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.startAnimation()
        presenter?.getUserDetails(userName:userName)
    }
   
    func showUserDetailList(list:UserDetails) {
        self.stopAnimatig()
        
        login.text = list.login
        followers_url.text = list.followers_url
        location.text = list.location
        name.text = list.name 
        public_repos.text = String(list.public_repos)
        public_gists.text = String(list.public_gists)
        followers.text = String(list.followers)
        updated_at.text = String(list.updated_at)
    }
    
    /// Static method will initialize the view
    ///
    /// - Returns: CheckoutConfigurationViewController instance to be presented
    static func instantiate() -> UserDetailViewProtocol{
         return UIStoryboard(name: "UserDetailsViewController", bundle: nil).instantiateViewController(withIdentifier: "UserDetailsView") as! UserDetailsViewController
        }
    
}
