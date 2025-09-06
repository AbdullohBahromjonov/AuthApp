//
//  TabScreen.swift
//  AuthApp
//
//  Created by Abdulloh Bahromjonov on 05/09/25.
//

import SwiftUI

struct TabScreen: View {
    @State var selectedTab = 0
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                GiftsScreen()
                    .tag(0)
                
                Text("Flowers")
                    .tag(1)
                
                Text("Events")
                    .tag(2)
                
                Text("Cart")
                    .tag(3)
                
                Text("Profile")
                    .tag(4)
            }
            .padding(.bottom, 70)
            
            CustomTabBar(selection: $selectedTab)
        }
    }
}

#Preview {
    TabScreen()
}
