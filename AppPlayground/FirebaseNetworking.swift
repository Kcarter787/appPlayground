//
//  FirebaseNetworking.swift
//  AppPlayground
//
//  Created by Kevin Carter on 2/2/17.
//  Copyright © 2017 Kevin Carter. All rights reserved.
//

import Firebase
import Batch
class Network {

    let rootRef = FIRDatabase.database().reference()
    // firebaseAuthData is populated by the result of "authAnonymouslyWithCompletionBlock" / "authWithOAuthProvider"
//    let firebaseAuthData: FAuthData = FIR
//    
//    let editor = BatchUser.editor()
//    editor.setIdentifier(firebaseAuthData.uid)
//    editor.save() // Do not forget to save the changes!
    static func get() {
        
    }
}
