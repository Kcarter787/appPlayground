//
//  ViewController.swift
//  AppPlayground
//
//  Created by Kevin Carter on 2/2/17.
//  Copyright © 2017 Kevin Carter. All rights reserved.
//

import UIKit
import FacebookLogin

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let loginButton = LoginButton(readPermissions: [ .publicProfile, .userFriends, .email ])
//        loginButton.center = view.center
        view.addSubview(fbLoginButton)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //MARK: - Lazy init
    private lazy var fbLoginButton: UIButton = {
        // Add a custom login button to your app
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor.darkGray
        button.frame = CGRect(x: 0, y: 0, width: 180, height: 40)
        button.center = self.view.center
        button.setTitle("My Login Button", for: .normal)
        button.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
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
}

