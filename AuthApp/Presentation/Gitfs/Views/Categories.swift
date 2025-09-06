//
//  Categories.swift
//  AuthApp
//
//  Created by Abdulloh Bahromjonov on 05/09/25.
//


import SwiftUI

enum Categories: Int, Identifiable, CaseIterable {
    case newPopularArrivals
    case mixedFlowers
    case thankYou
    
    var id: Int {
        return rawValue
    }
    
    var image: ImageResource {
        switch self {
        case .newPopularArrivals:
            return .newPopularArrivals
        case .mixedFlowers:
            return .mixedFlowers
        case .thankYou:
            return .thankYou
        }
    }
    
    var title: String {
        switch self {
        case .newPopularArrivals:
            return "New Popular Arrivals"
        case .mixedFlowers:
            return "Mixed Flowers"
        case .thankYou:
            return "Thank You"
        }
    }
}