//
//  FacebookManager.swift
//  Yum
//
//  Created by Moshe on 12/12/14.
//  Copyright (c) 2014 Moshe Berman. All rights reserved.
//

import Foundation
import Accounts
import Social

class FacebookManager: NSObject {
    
    // MARK: - Instance Variables
    
    var accountStore : ACAccountStore?
    
    //  MARK: - Singleton Access
    
    class var SharedManager : FacebookManager {
        struct Static {
            static let instance : FacebookManager = FacebookManager()
        }
        return Static.instance
    }
    
    //  MARK: - Initializer
    
    override init() {
        accountStore = ACAccountStore()
        super.init()
    }
    
    //  MARK: - Log In
    
    func logIn(completion:ACAccountStoreRequestAccessCompletionHandler!) {
        let accountStore : ACAccountStore = self.accountStore!
        
        let accountType : ACAccountType? = accountStore.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierFacebook)
        
        let options : NSDictionary = [
            ACFacebookAppIdKey : "",
            ACFacebookPermissionsKey : ["user_groups", "user_friends"],
            ACFacebookAudienceKey : ACFacebookAudienceEveryone
        ]
        
        accountStore.requestAccessToAccountsWithType(accountType, options: options) { granted, error in
            
            if let completionBlock = completion {
                completionBlock(granted, error)
            }
        }

    }
    
    
}
