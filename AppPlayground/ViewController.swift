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
//    private lazy var customFBLoginButton: UIButton = {
//        // Add a custom login button to your app
//        let button = UIButton(type: .custom)
//        button.backgroundColor = UIColor.darkGray
//        button.frame = CGRect(x: 0, y: 0, width: 180, height: 40)
//        button.center = self.view.center
//        button.setTitle("My Login Button", for: .normal)
//        button.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
//        return button
//    }()
    
    private lazy var fbLoginButton: LoginButton = {
        let button = LoginButton(readPermissions: [ .publicProfile, .userFriends, .email ])
        button.delegate = self
        return button
    }()
    
    
    //MARK: - Actions
//    @objc
//    func loginButtonClicked() {
//        let loginManager = LoginManager()
//        loginManager.logIn([ .publicProfile, .userFriends, .email ], viewController: self) { loginResult in
//            switch loginResult {
//            case .failed(let error):
//                print(error)
//            case .cancelled:
//                print("User cancelled login.")
//            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
//                print("Logged in!")
//            }
//        }
//    }
    
    private func setUserDefault(value val: String, forKey: String) {
        let userDefaults = Foundation.UserDefaults.standard
        userDefaults.set(val, forKey: forKey)
    }
    
    //MARK: LoginButtonDelegate Methods
    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
        switch result {
        case .failed(let error):
            print(error)
        case .cancelled:
            print("User cancelled login.")
        case .success(let grantedPermissions, let declinedPermissions, let accessToken):
            print("Logged in!")
            setUserDefault(value: accessToken.authenticationToken, forKey: Constants.UserDefaults.authToken)
            Logger.examine(object: declinedPermissions, withLabel: "DeclinedPerms")
            Logger.examine(object: grantedPermissions, withLabel: "GrantedPerms")
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: LoginButton) {

        //To retrieve from the key

    }
    
}

