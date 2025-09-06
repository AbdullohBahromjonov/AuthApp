//
//  AuthRepositoryImpl.swift
//  AuthApp
//
//  Created by Abdulloh Bahromjonov on 06/09/25.
//

import UIKit
import FirebaseAuth

final class AuthRepositoryImpl: AuthRepository {
    private let api: AuthAPIDataSource
    
    init(api: AuthAPIDataSource = AuthAPIDataSource()) {
        self.api = api
    }
    
    func signInWithGoogle(
        presenting: UIViewController,
        completion: @escaping (Result<AuthDataResult, Error>) -> Void
    ) {
        Task {
            await api.signInWithGoogle(presenting: presenting, completion: completion)
        }
    }
    
    func signInWithAppleMock(completion: @escaping (Result<AuthDataResult, Error>) -> Void) {
        Task {
            await api.signInWithAppleMock(completion: completion)
        }
    }
    
    func signOut(completion: (Result<Void, Error>) -> Void) {
        api.signOut(completion: completion)
    }
}
