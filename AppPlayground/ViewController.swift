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
import Firebase
class ViewController: UIViewController, LoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewHierachy()
        setUpViewConstraints()
        
    }
    
    
    //MARK: View Hierachy
    private func setUpViewHierachy() {
        view.addSubview(fbLoginButton)
    }
    
    
    //MARK: Constraints
    private func setUpViewConstraints() {
        fbLoginButton.center = self.view.center
    }
    
    
    //MARK: - Actions
    @objc
    private func sendGroupInvite() {
        let url = URLRequest(url: URL(string: Constants.postURLs.batchTransaction)!)
        
        
    }
    
    
    //MARK: - Lazy init
    private lazy var fbLoginButton: LoginButton = {
        let button = LoginButton(readPermissions: [ .publicProfile, .userFriends, .email ])
        button.delegate = self
        return button
    }()
    
    private lazy var inviteButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 50, y: 250, width: 180, height: 44))
        button.setTitle(Constants.appActionTitles.standardInvite, for: .normal)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(sendGroupInvite), for: .touchUpInside)
        return button
    }()

    //MARK: - Helpers
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

