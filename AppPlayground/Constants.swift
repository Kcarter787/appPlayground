//
//  Constants.swift
//  AppPlayground
//
//  Created by Kevin Carter on 2/2/17.
//  Copyright © 2017 Kevin Carter. All rights reserved.
//

struct Constants {
    
    
    //MARK: - API KEYS
    struct apiKeys {
        static let developmentBatch = "DEV5893B498B8A1A24670EE326F7AA"
        static let liveBatch = "5893B498B87972E98DAB26B276A85C"
        static let restKey = "44ad1b21fdd244c4ab9e0b414a545858"
    }
    
    //MARK: - UserDefault Keys
    struct UserDefaults {
        static let authToken = "authToken"
    }
    
    //MARK: - AppAction Titles
    struct appActionTitles {
        static let standardInvite = "Invite"
        static let leaveGroup = "Leave group"
    }
    
    //MARK: - PostURLs
    struct postURLs {
        static let batchTransaction = "https://api.batch.com/1.1/\(Constants.apiKeys.developmentBatch)/transactional/send"
    }
    
    //MARK: - Test Data
    struct testData {
        
        static let sampleParams = ""
    }
    
}
