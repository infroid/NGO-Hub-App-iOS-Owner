//
//  constants.swift
//  ngo-hub-2
//
//  Created by kunwar anirudh singh on 26/10/18.
//  Copyright © 2018 kunwar anirudh singh. All rights reserved.
//

import Foundation
import UIKit
//contains extensions for color to support hex valuse and contain some static code codes
extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

extension UIColor {
    var hexString: String {
        let colorRef = cgColor.components
        let r = colorRef?[0] ?? 0
        let g = colorRef?[1] ?? 0
        let b = ((colorRef?.count ?? 0) > 2 ? colorRef?[2] : g) ?? 0
        
        let color = String(
            format: "#%02lX%02lX%02lX",
            lroundf(Float(r * 255)),
            lroundf(Float(g * 255)),
            lroundf(Float(b * 255))
        )
        
        return color
    }
}

extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}
struct Constants {
    
    static let kPieChartCell = "PieChartCell"
    static let XJYSkyBlue = UIColor(red: 120.0 / 176.0, green: 169.0 / 255.0, blue: 226.0 / 255.0, alpha: 1.0)
    static let XJYGrey = UIColor(red: 246.0 / 255.0, green: 246.0 / 255.0, blue: 246.0 / 255.0, alpha: 1.0)
    static let XJYLightBlue = UIColor(red: 94.0 / 255.0, green: 147.0 / 255.0, blue: 196.0 / 255.0, alpha: 1.0)
    static let XJYGreen = UIColor(red: 77.0 / 255.0, green: 186.0 / 255.0, blue: 122.0 / 255.0, alpha: 1.0)
    static let XJYTitleColor = UIColor(red: 0.0 / 255.0, green: 189.0 / 255.0, blue: 113.0 / 255.0, alpha: 1.0)
    static let XJYButtonGrey = UIColor(red: 141.0 / 255.0, green: 141.0 / 255.0, blue: 141.0 / 255.0, alpha: 1.0)
    static let XJYLightGreen = UIColor(red: 77.0 / 255.0, green: 216.0 / 255.0, blue: 122.0 / 255.0, alpha: 1.0)
    static let XJYFreshGreen = UIColor(red: 77.0 / 255.0, green: 196.0 / 255.0, blue: 122.0 / 255.0, alpha: 1.0)
    static let XJYDeepGreen = UIColor(red: 77.0 / 255.0, green: 176.0 / 255.0, blue: 122.0 / 255.0, alpha: 1.0)
    static let XJYRed = UIColor(red: 245.0 / 255.0, green: 94.0 / 255.0, blue: 78.0 / 255.0, alpha: 1.0)
    static let XJYMauve = UIColor(red: 88.0 / 255.0, green: 75.0 / 255.0, blue: 103.0 / 255.0, alpha: 1.0)
    static let XJYBrown = UIColor(red: 119.0 / 255.0, green: 107.0 / 255.0, blue: 95.0 / 255.0, alpha: 1.0)
    static let XJYBlue = UIColor(red: 82.0 / 255.0, green: 116.0 / 255.0, blue: 188.0 / 255.0, alpha: 1.0)
    static let XJYDarkBlue = UIColor(red: 121.0 / 255.0, green: 134.0 / 255.0, blue: 142.0 / 255.0, alpha: 1.0)
    static let XJYYellow = UIColor(red: 242.0 / 255.0, green: 197.0 / 255.0, blue: 117.0 / 255.0, alpha: 1.0)
    static let XJYWhite = UIColor(red: 255.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
    static let XJYDeepGrey = UIColor(red: 99.0 / 255.0, green: 99.0 / 255.0, blue: 99.0 / 255.0, alpha: 1.0)
    static let XJYPinkGrey = UIColor(red: 200.0 / 255.0, green: 193.0 / 255.0, blue: 193.0 / 255.0, alpha: 1.0)
    static let XJYHealYellow = UIColor(red: 245.0 / 255.0, green: 242.0 / 255.0, blue: 238.0 / 255.0, alpha: 1.0)
    static let XJYLightGrey = UIColor(red: 225.0 / 255.0, green: 225.0 / 255.0, blue: 225.0 / 255.0, alpha: 1.0)
    static let XJYCleanGrey = UIColor(red: 251.0 / 255.0, green: 251.0 / 255.0, blue: 251.0 / 255.0, alpha: 1.0)
    static let XJYLightYellow = UIColor(red: 241.0 / 255.0, green: 240.0 / 255.0, blue: 240.0 / 255.0, alpha: 1.0)
    static let XJYDarkYellow = UIColor(red: 152.0 / 255.0, green: 150.0 / 255.0, blue: 159.0 / 255.0, alpha: 1.0)
    static let XJYPinkDark = UIColor(red: 170.0 / 255.0, green: 165.0 / 255.0, blue: 165.0 / 255.0, alpha: 1.0)
    static let XJYCloudWhite = UIColor(red: 244.0 / 255.0, green: 244.0 / 255.0, blue: 244.0 / 255.0, alpha: 1.0)
    static let XJYBlack = UIColor(red: 45.0 / 255.0, green: 45.0 / 255.0, blue: 45.0 / 255.0, alpha: 1.0)
    static let XJYStarYellow = UIColor(red: 252.0 / 255.0, green: 223.0 / 255.0, blue: 101.0 / 255.0, alpha: 1.0)
    static let XJYTwitterColor = UIColor(red: 0.0 / 255.0, green: 171.0 / 255.0, blue: 243.0 / 255.0, alpha: 1.0)
    static let XJYWeiboColor = UIColor(red: 250.0 / 255.0, green: 0.0 / 255.0, blue: 33.0 / 255.0, alpha: 1.0)
    static let XJYiOSGreenColor = UIColor(red: 98.0 / 255.0, green: 247.0 / 255.0, blue: 77.0 / 255.0, alpha: 1.0)
}

extension Constants {
    static func RGBA(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat) -> UIColor {
        return UIColor(red: r / CGFloat(255.0), green: g / CGFloat(255.0), blue: b / CGFloat(255.0), alpha: a)
    }
    static func RGB(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UIColor {
        return RGBA(r, g, b, CGFloat(1.0))
    }
}
