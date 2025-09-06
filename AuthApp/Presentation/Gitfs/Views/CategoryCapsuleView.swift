//
//  CategoryCapsuleView.swift
//  AuthApp
//
//  Created by Abdulloh Bahromjonov on 05/09/25.
//


import SwiftUI

struct CategoryCapsuleView: View {
    let titel: String
    
    var body: some View {
        Label(titel, systemImage: "chevron.down")
            .labelStyle(TrailingIconLabelStyle())
            .font(.system(size: 14, weight: .medium))
            .padding(.horizontal, 2)
            .padding(8)
            .background(
                Capsule()
                    .fill(Colors.veryLight)
            )
    }
}