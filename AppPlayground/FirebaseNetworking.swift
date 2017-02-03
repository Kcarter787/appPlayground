//
//  FirebaseNetworking.swift
//  AppPlayground
//
//  Created by Kevin Carter on 2/2/17.
//  Copyright © 2017 Kevin Carter. All rights reserved.
//

import Firebase
import Batch
import FirebaseAuth
class Network {

    let rootRef = FIRDatabase.database().reference()
    // firebaseAuthData is populated by the result of "authAnonymouslyWithCompletionBlock" / "authWithOAuthProvider"
    
    
    static func get() {
        
    }
    static func connectBatchWithFirebase(firebaseUserId: String?) {
        let editor = BatchUser.editor()
        editor.setIdentifier(firebaseUserId)
        editor.save() // Do not forget to save the changes!
        
    }
}
