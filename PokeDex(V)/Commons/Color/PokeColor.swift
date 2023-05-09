//  PokeColor.swift
//  PokeDex(V)
//  Created by Abraham Vazquez on 09/05/23.

import UIKit

@objc
public enum BCColorStyle: Int{
    
    case PRed = 1
    case PYellow = 2
    case POrange = 3
    case PBlue = 4
    
    public var color: UIColor {
        
        switch self {
        case .PRed:
            return .PRed
        case .PYellow:
            return .PYellow
        case .POrange:
            return .POrange
        case .PBlue:
            return .PBlue
        }
    }
    
    static internal func colorWith(value: Int) -> UIColor {
        if let color = BCColorStyle(rawValue: value)?.color {
            return color
        }
        return .clear
    }
    
}
