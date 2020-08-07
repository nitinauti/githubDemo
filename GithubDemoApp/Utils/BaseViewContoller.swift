//
//  BaseViewContoller.swift
//  GithubDemoApp
//
//  Created by Nitin Auti on 02/08/20.
//  Copyright © 2020 Nitin Auti. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView

class BaseViewContoller: UIViewController,UIAlertViewDelegate,NVActivityIndicatorViewable{
   
    // MARK: - Private
    var slecteditemDropdown = String()
    let EmptyText = UILabel()
    let BackroundView = UIView()
    private var previousTextFieldContent: String?
    private var previousSelection: UITextRange?

        
    override func viewDidLoad() {
        super.viewDidLoad()
    
      }

    /// setting empty text view for utableview
    func setemptyText(list:NSArray,tableview:UITableView,superview:UIView,EmptyText:String,Y:CGFloat){
        if list.count == 0 {
             tableview.isHidden = true
             self.EmptyText.isHidden = false
             self.EmptyText.frame = CGRect(x: 10, y: Y, width:self.view.frame.width - 30, height: 100)
             self.EmptyText.textAlignment = .center
             self.EmptyText.text = EmptyText
             self.EmptyText.numberOfLines = 4
             self.EmptyText.font = UIFont(name: "Avenir-Book ", size:2.0)
             self.EmptyText.textColor = UIColor.gray
            // superview.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100)
             superview.addSubview(self.EmptyText)
         }else{
             tableview.isHidden = false
             self.EmptyText.isHidden = true
             superview.willRemoveSubview(self.EmptyText)
        }
    }


    /// show service message
    func showServiceToast(message : String) {
        let maintostView = UIView(frame: CGRect(x: ((self.view.frame.size.width/2) - 150), y:self.view.frame.size.height-200, width:300, height: 80))
             maintostView.backgroundColor = .white
            maintostView.layer.cornerRadius = 10;
            maintostView.clipsToBounds  =  true
        
        let toastLabel = UILabel(frame: CGRect(x: 15 , y:5 , width:270, height: 80))
            toastLabel.textColor = UIColor.black
            toastLabel.textAlignment = .center;
            toastLabel.font = UIFont(name: "Avenir-Book ", size:3.0)
            toastLabel.text = message
            toastLabel.numberOfLines = 0
            toastLabel.alpha = 1.0
            
            maintostView.addSubview(toastLabel)
            self.view.addSubview(maintostView)
            UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseOut, animations: {
                maintostView.alpha = 0.5
            }, completion: {(isCompleted) in
                maintostView.removeFromSuperview()
         })
    }
    
    /// start animation of api
    func startAnimation(){
            let size = CGSize(width: 30, height: 30)
        startAnimating(size,message:"Loading...",type: .ballClipRotate,color:UIColor.init(named:"E8BE3A"),textColor:.white)
    }
    
    /// stop animating of api
    func stopAnimatig(){
            stopAnimating()
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        self.navigationItem.hidesBackButton = true
    }
    
}
