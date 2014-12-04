//
//  YumLoginSplitController.swift
//  Yum
//
//  Created by Moshe on 12/4/14.
//  Copyright (c) 2014 Moshe Berman. All rights reserved.
//

import Cocoa

class YumLoginSplitController: NSSplitViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let heightConstraint = NSLayoutConstraint(item: self.splitView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute:.NotAnAttribute, multiplier: 1.0, constant: 100)
        let widthConstraint = NSLayoutConstraint(item: self.splitView, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute:.NotAnAttribute, multiplier: 1.0, constant: 256)
        
        self.splitView.addConstraint(widthConstraint)
        self.splitView.addConstraint(heightConstraint)
        
    }
    
    // Mark: - NSSplitViewDelegate
    
    override func splitView(splitView: NSSplitView, canCollapseSubview subview: NSView) -> Bool {
        return true
    }
}