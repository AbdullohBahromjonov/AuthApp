//
//  AuthScreen.swift
//  AuthApp
//
//  Created by Abdulloh Bahromjonov on 05/09/25.
//

import SwiftUI

struct AuthScreen: View {
    @StateObject var viewModel: AuthViewModel = AuthViewModel()
    
    var body: some View {
        ZStack {
            Colors.veryLight
                .ignoresSafeArea()
            Image(.authBackground)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .offset(y: 40)
            
            VStack(spacing: 10) {
                CustomNavBar(
                    title: "Welcome",
                    trailingItem: {
                        Button("Skip", action: {})
                    }
                )
                .foregroundColor(Colors.darkBlue)
                
                Text("Enter your phone number. We will send you an SMS with a confirmation code to this number.")
                    .font(.system(size: 14))
                    .foregroundColor(Colors.lightGray)
                
                Spacer()
                
                Image(.authRose)
                
                VStack(spacing: 8) {
                    AuthButton(
                        icon: .appleIcon,
                        title: "Continue with Apple",
                        action: {
                            viewModel.signInWithAppleMock()
                        }
                    )
                    
                    AuthButton(
                        icon: .googleIcon,
                        title: "Continue with Google",
                        action: {
                            if let rootVC = UIApplication.shared.connectedScenes
                                .compactMap({ $0 as? UIWindowScene })
                                .first?.windows.first?.rootViewController {
                                viewModel.signInWithGoogle(presenting: rootVC)
                            }
                        }
                    )
                }
                
                TermsAndPolicyText()
                
                Spacer()
            }
            .padding()
        }
    }
    
    @ViewBuilder
    func TermsAndPolicyText() -> some View {
        var attributedString: AttributedString {
            var text = AttributedString("By continuing, you agree to Assetsy's\nTerms of Use and Privacy Policy")
            
            if let termsRange = text.range(of: "Terms of Use") {
                text[termsRange].foregroundColor = .blue
                text[termsRange].underlineStyle = .single
                text[termsRange].link = URL(string: "https://x.com")
            }
            
            if let privacyRange = text.range(of: "Privacy Policy") {
                text[privacyRange].foregroundColor = .blue
                text[privacyRange].underlineStyle = .single
                text[privacyRange].link = URL(string: "https://x.com")
            }
            
            return text
        }
        
        Text(attributedString)
            .multilineTextAlignment(.center)
            .font(.system(size: 11))
            .foregroundColor(Color.init(hex: "#3A3A3A"))
            .environment(\.openURL, OpenURLAction { url in
                return .systemAction(url)
            })
    }
}

#Preview {
    AuthScreen()
}
