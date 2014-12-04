//
//  YumWindowController.swift
//  Yum
//
//  Created by Moshe on 12/2/14.
//  Copyright (c) 2014 Moshe Berman. All rights reserved.
//

import Cocoa

class YumWindowController: NSWindowController, NSToolbarDelegate, NSSplitViewDelegate {
    
    @IBOutlet var toolbar : NSToolbar?
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        if let window = self.window {
            window.title = "Yum"
        }
        
    }
    
    //  MARK: - NSToolbarDelegate
    
    override func validateToolbarItem(theItem: NSToolbarItem) -> Bool {
        return true
    }
}