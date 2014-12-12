//
//  YumLoginPanelViewController.swift
//  Yum
//
//  Created by Moshe on 12/4/14.
//  Copyright (c) 2014 Moshe Berman. All rights reserved.
//

import Cocoa
import Social
import Accounts

class YumLoginPanelViewController : NSViewController {
    
    // MARK: - Login/Logout
    
    @IBAction func logIn(sender: AnyObject?) {
        
        let manager = FacebookManager.SharedManager
        
        let facebookAppIdKey : NSString? = nil
        let facebookPermissions : NSArray? = []
        let facebookAudienceKey : NSString = ACFacebookAudienceFriends
        
        manager.logIn(facebookAppIdKey, permissions: facebookPermissions, audience: facebookAudienceKey, completion: { granted , error in
            NSLog("Granted: %i", granted)
            NSLog("Error: %@", error)
        })
    }
}
