//
//  AuthViewModel.swift
//  AuthApp
//
//  Created by Abdulloh Bahromjonov on 05/09/25.
//

import SwiftUI
import FirebaseAuth
import GoogleSignIn
import AuthenticationServices
import FirebaseCore

@MainActor
class AuthViewModel: ObservableObject {
    @Published var user: User?
    @Published var errorMessage: String?
    
    private let authUseCase: AuthUseCase
    private let getTokenUseCase: GetTokenUseCase

    init(
        authUseCase: AuthUseCase = AuthUseCase(),
        getTokenUseCase: GetTokenUseCase = GetTokenUseCase()
    ) {
        self.user = Auth.auth().currentUser
        self.authUseCase = authUseCase
        self.getTokenUseCase = getTokenUseCase
    }

    func signInWithGoogle(presenting: UIViewController) {
        authUseCase.signInWithGoogle(presenting: presenting) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    if let idToken = success.credential?.idToken {
                        KeychainService.shared.idToken = idToken
                        self?.getToken(idToken)
                    } else {
                        self?.errorMessage = "Couldn't get id token"
                    }
                case .failure(let failure):
                    self?.errorMessage = failure.localizedDescription
                }
            }
        }
    }

    func signInWithAppleMock() {
        authUseCase.signInWithApple { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    if let idToken = success.credential?.idToken {
                        KeychainService.shared.idToken = success.credential?.idToken
                        self?.getToken(idToken)
                    } else {
                        self?.errorMessage = "Couldn't get id token"
                    }
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        }
    }

    func signOut() {
        authUseCase.signOut { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success():
                    self?.user = nil
                case .failure(let failure):
                    self?.errorMessage = failure.localizedDescription
                }
            }
        }
    }
    
    func getToken(_ token: String) {
        Task {
            do {
                let accessToken = try await getTokenUseCase.getToken(idToken: token)
                print("SUCCESS \(accessToken)")
                DispatchQueue.main.async {
                    KeychainService.shared.token = accessToken
                }
            } catch {
                print(error.localizedDescription)
                DispatchQueue.main.async { [weak self] in
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
