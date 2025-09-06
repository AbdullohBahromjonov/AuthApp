//
//  TabbedItems.swift
//  AuthApp
//
//  Created by Abdulloh Bahromjonov on 05/09/25.
//


import SwiftUI

enum TabbedItems: Int, CaseIterable{
    case gifts = 0
    case flowers
    case events
    case profile
    
    var title: String{
        switch self {
        case .gifts:
            return "Gifts"
        case .flowers:
            return "Flowers"
        case .events:
            return "Events"
        case .profile:
            return "Profile"
        }
    }
    
    var iconName: ImageResource {
        switch self {
        case .gifts:
            return .giftIcon
        case .flowers:
            return .flowerIcon
        case .events:
            return .eventsIcon
        case .profile:
            return .profileIcon
        }
    }
}