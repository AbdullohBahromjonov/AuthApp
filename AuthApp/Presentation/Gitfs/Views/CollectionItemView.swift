//
//  CategoryItemView.swift
//  AuthApp
//
//  Created by Abdulloh Bahromjonov on 05/09/25.
//


import SwiftUI

struct CollectionItemView: View {
    let image: ImageResource
    let title: String
    
    var body: some View {
        VStack {
            Image(image)
            Text(title)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(Colors.darkBlue)
                .multilineTextAlignment(.center)
                .lineLimit(2)
        }
        .frame(width: 90)
    }
}
