//
//  CustomTabItem.swift
//  AuthApp
//
//  Created by Abdulloh Bahromjonov on 05/09/25.
//

import SwiftUI

struct CustomTabItem: View {
    let image: ImageResource
    let title: String
    var isActive: Bool
    
    var body: some View {
        VStack(spacing: 8) {
            Image(image)
            
            Text(title)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(isActive ? Colors.darkBlue : Colors.light)
        }
        .frame(maxWidth: .infinity)
    }
}
