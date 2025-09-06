//
//  CustomTabBar.swift
//  AuthApp
//
//  Created by Abdulloh Bahromjonov on 05/09/25.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selection: Int
    
    var body: some View {
        VStack {
            Divider()
                .overlay(Colors.darkBlue)
            
            HStack {
                ForEach((TabbedItems.allCases), id: \.self){ item in
                    Button{
                        selection = item.rawValue
                    } label: {
                        CustomTabItem(
                            image: item.iconName,
                            title: item.title,
                            isActive: (selection == item.rawValue)
                        )
                    }
                }
            }
            .padding(.horizontal, 30)
            .padding(.top, 10)
            .padding(6)
        }
        .background(Colors.white)
    }
}
