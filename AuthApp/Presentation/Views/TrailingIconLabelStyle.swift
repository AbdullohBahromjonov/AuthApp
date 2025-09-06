//
//  TrailingIconLabelStyle.swift
//  AuthApp
//
//  Created by Abdulloh Bahromjonov on 05/09/25.
//


import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 3) {
            configuration.title
            configuration.icon
        }
    }
}