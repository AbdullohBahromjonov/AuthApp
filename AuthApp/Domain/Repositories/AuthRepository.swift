//
//  AuthRepository.swift
//  AuthApp
//
//  Created by Abdulloh Bahromjonov on 06/09/25.
//

import UIKit
import FirebaseAuth

protocol AuthRepository {
    func signInWithGoogle(
        presenting: UIViewController,
        completion: @escaping (Result<AuthDataResult, Error>) -> Void
    )
    
    func signInWithAppleMock(
        completion: @escaping (Result<AuthDataResult, Error>) -> Void
    )
    
    func signOut(completion: (Result<Void, Error>) -> Void)
}
