//
//  AuthButton.swift
//  AuthApp
//
//  Created by Abdulloh Bahromjonov on 05/09/25.
//


import SwiftUI

struct AuthButton: View {
    let icon: ImageResource
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(
            action: action,
            label: {
                HStack {
                    Image(icon)
                    Text(title)
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.black)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Colors.white)
                .cornerRadius(10)
            }
        )
    }
}