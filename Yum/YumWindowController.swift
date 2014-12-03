//
//  YumWindowController.swift
//  Yum
//
//  Created by Moshe on 12/2/14.
//  Copyright (c) 2014 Moshe Berman. All rights reserved.
//

import Cocoa

class YumWindowController: NSWindowController, NSToolbarDelegate {
    
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

class YumLoginSplitController: NSSplitViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let heightConstraint = NSLayoutConstraint(item: self.splitView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute:.NotAnAttribute, multiplier: 1.0, constant: 100)
        let widthConstraint = NSLayoutConstraint(item: self.splitView, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute:.NotAnAttribute, multiplier: 1.0, constant: 160)

        self.splitView.addConstraint(widthConstraint)
        self.splitView.addConstraint(heightConstraint)
        
    }
    
}