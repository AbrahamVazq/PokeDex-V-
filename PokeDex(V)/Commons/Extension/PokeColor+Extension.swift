//  PokeColor+Extension.swift
//  PokeDex(V)
//  Created by Abraham Vazquez on 09/05/23.

import UIKit

//MARK: - UI · C O L O R
@objc
public extension UIColor {
    
    static var PRed: UIColor{
        return .getPrincipalRed()
    }
    
    static var PYellow: UIColor {
        return .getPrincipalYellow()
    }
    
    static var POrange: UIColor {
        return .getPrincipalOrgane()
    }
    
    static var PBlue: UIColor {
        return .getPrincipalBlue()
    }
    
    private static func getPrincipalRed() -> UIColor{
        return .getColorWith(hex: "#EE1C23")
    }
    
    private static func getPrincipalYellow() -> UIColor {
        return .getColorWith(hex: "#EEE71C")
    }
    
    private static func getPrincipalOrgane() -> UIColor {
        return .getColorWith(hex: "#EE7E1C")
    }
    
    private static func getPrincipalBlue() -> UIColor {
        return .getColorWith(hex: "#2196F3")
    }
    
    static func getColorWith(hex: String, alpha: CGFloat = 1.0) -> UIColor {
        let hex: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hex)
        if hex.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        return UIColor.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}
