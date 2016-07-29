//
//  BlurView.swift
//  calculator
//
//  Created by Subham on 7/15/16.
//  Copyright © 2016 Subham Gain. All rights reserved.
//

import UIKit
@IBDesignable class BlurView : UIView {
    // Use the following property to set the tintColor. Set it to nil to reset.
    @IBInspectable var blurTintColor: UIColor! {
        set {
            toolbar.barTintColor = blurTintColor
        }
        get {
            return toolbar.barTintColor
        }
    }
    lazy var toolbar:UIToolbar = {
        // If we don't clip to bounds the toolbar draws a thin shadow on top
        self.clipsToBounds = true
        
        let toolbar = UIToolbar(frame: self.bounds)
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        self.insertSubview(toolbar, atIndex: 0)
        let views = ["toolbar": toolbar]
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[toolbar]|", options: [], metrics: nil, views: views))
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[toolbar]|", options: [], metrics: nil, views: views))
        
        return toolbar
    }()
}