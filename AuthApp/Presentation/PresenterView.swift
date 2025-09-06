//
//  PresenterView.swift
//  AuthApp
//
//  Created by Abdulloh Bahromjonov on 07/09/25.
//

import SwiftUI

struct PresenterView: View {
    var body: some View {
        if KeychainService.shared.token != nil {
            TabScreen()
        } else {
            AuthScreen()
        }
    }
}

#Preview {
    PresenterView()
}
