//
//  YumLoginPanelViewController.swift
//  Yum
//
//  Created by Moshe on 12/4/14.
//  Copyright (c) 2014 Moshe Berman. All rights reserved.
//

import Cocoa

class YumLoginPanelViewController : NSViewController {
    
    @IBAction func showLoginWindow(sender: AnyObject!) {
        STLoginDirector.sharedDirector().logUserInWithCompletion { (success: Bool, state: STLoginState) -> Void in
            
            let tokenManager : STTokenManager = STLoginDirector.sharedDirector().tokenManager()
            
            
            
        }
    }
}
