//
//  DesignableImageView.swift
//  uidemo
//
//  Created by HIMALAYA RAJPUT on 28/02/18.
//  Copyright © 2018 kiet. All rights reserved.
//

import UIKit
//extension to customise imageview to add shadow, border, corner radius
extension UIImageView {
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}

 @IBDesignable class DesignableImageView: UIImageView {
    
    @IBInspectable var BorderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = BorderWidth
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable var CornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = CornerRadius
        }
    }
    @IBInspectable var ShadowColor: UIColor = UIColor.clear {
        didSet {
            self.layer.shadowColor = ShadowColor.cgColor
        }
    }
    @IBInspectable var ShadowOffSet: CGSize = CGSize(width: 0, height: 0) {
        didSet {
            self.layer.shadowOffset = ShadowOffSet
        }
    }
    @IBInspectable var ShadowRadius: CGFloat = 0.0 {
        didSet {
            self.layer.shadowRadius = ShadowRadius
        }
    }
    @IBInspectable var shadowOpacity : Float = 0 {
        didSet {
            self.layer.shadowOpacity = shadowOpacity
        }
    }
    @IBInspectable var masksToBound : Bool = false {
        didSet {
            self.layer.masksToBounds = masksToBound
        }
    }
    
}
