//
//  FacebookViewController.swift
//  Weather
//
//  Created by Prajwal Maharjan on 12/22/17.
//  Copyright © 2017 Prajwal Maharjan. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

class FacebookViewController: UIViewController {
    var dict : [String : AnyObject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //creating button
        let loginButton = FBSDKLoginButton()
        loginButton.readPermissions =  [ "public_profile" ]
        loginButton.center = view.center
        
        //adding it to view
        view.addSubview(loginButton)
        
        //if the user is already logged in
        if (FBSDKAccessToken.current()) != nil{
            getFBUserData()
        }
    }
    
    //when login button clicked
    @objc func loginButtonClicked() {
        let fbLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withPublishPermissions: ["email"], from: self, handler: {(result, error) -> Void in
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                if(fbloginresult.grantedPermissions.contains("email"))
                {
                    self.getFBUserData()
                    fbLoginManager.logOut()
                }
            }
        })
    }
    
    //function is fetching the user data
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    self.dict = result as! [String : AnyObject]
                    print(result!)
                    print(self.dict)
                }
            })
        }
    }
}
