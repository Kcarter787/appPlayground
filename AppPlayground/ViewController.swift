//
//  ViewController.swift
//  AppPlayground
//
//  Created by Kevin Carter on 2/2/17.
//  Copyright © 2017 Kevin Carter. All rights reserved.
//

import UIKit
import FacebookLogin
import FBSDKLoginKit

class ViewController: UIViewController, LoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let loginButton = LoginButton(readPermissions: [ .publicProfile, .userFriends, .email ])
//        loginButton.center = view.center
        setUpViewHierachy()
        setUpViewConstraints()
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: View Hierachy
    private func setUpViewHierachy() {
        view.addSubview(fbLoginButton)
    }
    
    
    //MARK: Constraints
    private func setUpViewConstraints() {
        fbLoginButton.center = self.view.center
    }
    
    
    //MARK: - Lazy init
    private lazy var customFBLoginButton: UIButton = {
        // Add a custom login button to your app
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor.darkGray
        button.frame = CGRect(x: 0, y: 0, width: 180, height: 40)
        button.center = self.view.center
        button.setTitle("My Login Button", for: .normal)
        button.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        return button
    }()
    
    private lazy var fbLoginButton: LoginButton = {
        let button = LoginButton(readPermissions: [ .publicProfile, .userFriends, .email ])
        button.delegate = self
        return button
    }()
    
    
    //MARK: - Actions
    @objc
    func loginButtonClicked() {
        let loginManager = LoginManager()
        loginManager.logIn([ .publicProfile, .userFriends, .email ], viewController: self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                print("Logged in!")
                Logger.examine(object: grantedPermissions, withLabel: "AcceptedPerms")
                Logger.examine(object: declinedPermissions, withLabel: "DeclinedPerms")
                Logger.examine(object: accessToken, withLabel: "AccessToken")
            }
        }
    }
    
    
    //MARK: LoginButtonDelegate Methods
    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
        
    }
    
    func loginButtonDidLogOut(_ loginButton: LoginButton) {
        
    }
    
//    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
//        if let error = error {
//            print(error.localizedDescription)
//        }
//        Logger.examine(object: result.debugDescription, withLabel: "FB Login: ")
//    }
//    func loginButtonWillLogin(_ loginButton: FBSDKLoginButton!) -> Bool {
//        //
//        return true
//    }
//    
//    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
//        //
//    }
}

