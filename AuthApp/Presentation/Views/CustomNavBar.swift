//
//  CustomNavBar.swift
//  AuthApp
//
//  Created by Abdulloh Bahromjonov on 05/09/25.
//

import SwiftUI

struct CustomNavBar<Leading: View, Trailing: View, TitleItem: View>: View {
    let title: String
    let titleItem: () -> TitleItem
    let leadingItem: () -> Leading
    let trailingItem: () -> Trailing
    
    init(
        title: String,
        @ViewBuilder titleItem: @escaping () -> TitleItem = { EmptyView() },
        @ViewBuilder leadingItem: @escaping () -> Leading = { EmptyView() },
        @ViewBuilder trailingItem: @escaping () -> Trailing = { EmptyView() }
    ) {
        self.title = title
        self.titleItem = titleItem
        self.leadingItem = leadingItem
        self.trailingItem = trailingItem
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                leadingItem()
                
                Spacer()
                
                trailingItem()
            }
            
            HStack {
                Text(title.uppercased())
                    .font(.yffRare(size: 64))
                
                Spacer()
                
                titleItem()
            }
        }
    }
}
