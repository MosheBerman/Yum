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

class FacebookManager {
    
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
    
    init() {
        accountStore = ACAccountStore()
    }
    
    //  MARK: - Log In
    
    func logIn(appIdKey: NSString!, permissions: NSArray!, audience: NSString!, completion:ACAccountStoreRequestAccessCompletionHandler!) {
        
        //  Get the account store.
        if let accountStore : ACAccountStore = self.accountStore {
            
            //  Get the Facebook account type
            let accountType : ACAccountType? = accountStore.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierFacebook)
            
            let accounts = accountStore.accountsWithAccountType(accountType)
            
            if accounts.count == 0 {
                
                self.addAccount()
                return
                
            }
            
            //  Prepare the Facebook parameters
            //
            //  Use the audience key only if we're requesting publish_stream permission.
            
            var options : NSDictionary = [
                ACFacebookAppIdKey : appIdKey,
                ACFacebookPermissionsKey : permissions
            ]
            
            if permissions.containsObject("publish_stream") {
                
                let possiblePermissions : NSArray = [ACFacebookAudienceOnlyMe, ACFacebookAudienceFriends, ACFacebookAudienceEveryone]
                if possiblePermissions.containsObject(audience) {
                    options = [
                        ACFacebookAppIdKey : appIdKey,
                        ACFacebookPermissionsKey : permissions,
                        ACFacebookAudienceKey : audience
                    ]
                }
                else {
                    NSLog("You've passed an invalid value for ACFacebookAudienceKey while requesting write permission. (That's the \"publish_stream\" key. We're going to fail here, since Facebook won't let us in without either removing the permission or adding a valid audience key.")
                    
                    return  //
                }
                
            }
            
            //  Attempt to access the accounts.
            accountStore.requestAccessToAccountsWithType(accountType, options: options) { granted, error in
                
                if let completionBlock = completion {
                    completionBlock(granted, error)
                }
            }
            
        }
            // If there's no account store, handle here.
        else {
            NSLog("No account store!")
        }
        
    }
    
    //  MARK: - Add Account
    
    func addAccount() {
        if let accountStore : ACAccountStore = self.accountStore {
            let accountType : ACAccountType? = accountStore.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierFacebook)
            let account : ACAccount = ACAccount(accountType: accountType)
            
        }
    }
    
}
