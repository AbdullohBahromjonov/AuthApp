//
//  ProductItemView.swift
//  AuthApp
//
//  Created by Abdulloh Bahromjonov on 05/09/25.
//


import SwiftUI

struct ProductItemView: View {
    let image: ImageResource
    
    var body: some View {
        Image(image)
            .overlay(alignment: .topTrailing) {
                ZStack {
                    Circle()
                        .fill(Color.black.opacity(0.5))
                    Image(systemName: "heart")
                        .foregroundColor(Colors.white)
                        .font(.system(size: 16, weight: .medium))
                }
                .frame(width: 24, height: 24)
                .padding(8)
            }
    }
}