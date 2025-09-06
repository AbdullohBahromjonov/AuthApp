//
//  AuthUseCase.swift
//  AuthApp
//
//  Created by Abdulloh Bahromjonov on 06/09/25.
//

import FirebaseAuth
import UIKit

struct AuthUseCase {
    private let repository: AuthRepository
    
    init(repository: AuthRepository = AuthRepositoryImpl()) {
        self.repository = repository
    }
    
    func signInWithApple(completion: @escaping (Result<AuthDataResult, any Error>) -> Void) {
        repository.signInWithAppleMock(completion: completion)
    }
    
    func signInWithGoogle(
        presenting: UIViewController,
        completion: @escaping (Result<AuthDataResult, any Error>) -> Void
    ) {
        repository.signInWithGoogle(
            presenting: presenting,
            completion: completion
        )
    }
    
    func signOut(completion: @escaping (Result<Void, any Error>) -> Void) {
        repository.signOut(completion: completion)
    }
}
