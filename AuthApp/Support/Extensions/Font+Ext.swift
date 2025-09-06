//
//  Font+Ext.swift
//  AuthApp
//
//  Created by Abdulloh Bahromjonov on 05/09/25.
//


import SwiftUI

extension Font {
    enum YFFStyle {
        case alphaBlack
        case alphaBold
        case alphaMedium
        case alphaRegular
        case custom(String)
        
        var value: String {
            switch self {
            case .alphaBlack:
                return "AlphaBlack"
            case .alphaBold:
                return "AlphaBold"
            case .alphaMedium:
                return "AlphaMedium"
            case .alphaRegular:
                return "AlphaRegular"
            case .custom(let name):
                return name
            }
        }
    }
    
    static func yffRare(style: YFFStyle = .alphaBlack, size: CGFloat = 26) -> Font {
        return .custom("YFFRARETRIAL-\(style.value)", size: size)
    }
}
