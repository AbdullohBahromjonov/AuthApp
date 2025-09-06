//
//  GiftsScreen.swift
//  AuthApp
//
//  Created by Abdulloh Bahromjonov on 05/09/25.
//

import SwiftUI

struct GiftsScreen: View {
    let columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View {
        ZStack {
            Colors.veryLight
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                CustomNavBar(
                    title: "Gifts",
                    titleItem: SearchItem,
                    trailingItem: TrailingItem
                )
                .padding(.horizontal)
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 15) {
                        BannersView()
                        
                        CollectionView()
                        
                        VStack(spacing: 15) {
                            Text("View all categories")
                                .font(.system(size: 14, weight: .medium))
                                .padding(.horizontal, 2)
                                .padding(8)
                                .background(
                                    Capsule()
                                        .stroke(Colors.light, lineWidth: 1)
                                )
                            
                            HStack {
                                CategoryCapsuleView(titel: "Giftboxes")
                                CategoryCapsuleView(titel: "For Her")
                                CategoryCapsuleView(titel: "Popular")
                            }
                            
                            LazyVGrid(columns: columns) {
                                ForEach(0..<12) { _ in
                                    ProductItemView(image: .product1)
                                }
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Colors.white)
                        .cornerRadius(16)
                        .padding(.horizontal)
                        .padding(.bottom)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private func TrailingItem() -> some View {
        HStack(alignment: .center) {
            Text("Delivery to")
            Text("🇺🇸")
                .font(.system(size: 32))
            
            Label("USD", systemImage: "chevron.down")
                .labelStyle(TrailingIconLabelStyle())
        }
        .foregroundColor(Colors.darkBlue)
        .font(.system(size: 14))
    }
    
    @ViewBuilder
    private func SearchItem() -> some View {
        HStack(spacing: 5) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 22))
            Text("Search")
                .font(.system(size: 17))
        }
        .padding(10)
        .foregroundColor(Colors.light)
        .background(Colors.white)
        .cornerRadius(16)
    }
    
    @ViewBuilder
    private func CollectionView() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 15) {
                ForEach(Categories.allCases) { category in
                    CollectionItemView(
                        image: category.image,
                        title: category.title
                    )
                }
                
                Button("\n\n\nShow all", action: {})
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Colors.darkBlue)
            }
            .padding(.horizontal)
        }
    }
    
    @ViewBuilder
    private func BannersView() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<2) { _ in
                    Image(.banner)
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    GiftsScreen()
}
