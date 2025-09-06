//
//  AuthAPIDataSource.swift
//  AuthApp
//
//  Created by Abdulloh Bahromjonov on 06/09/25.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import GoogleSignIn

final class AuthAPIDataSource {
    @MainActor
    func signInWithGoogle(
        presenting: UIViewController,
        completion: @escaping (Result<AuthDataResult, Error>) -> Void
    ) async {
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            completion(.failure(AuthError.missingGoogleClientID))
            return
        }

        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        do {
            let googleResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: presenting)
            guard let idToken = googleResult.user.idToken?.tokenString else {
                throw AuthError.googleSignInFailed
            }

            let credential = GoogleAuthProvider.credential(
                withIDToken: idToken,
                accessToken: googleResult.user.accessToken.tokenString
            )

            let result = try await Auth.auth().signIn(with: credential)
            completion(.success(result))
        } catch let error as AuthError {
            completion(.failure(error))
        } catch {
            completion(.failure(error))
        }
    }
    
    
    
    func signInWithAppleMock(completion: @escaping (Result<AuthDataResult, Error>) -> Void) async {
        do {
            let result = try await Auth.auth().signInAnonymously()
            completion(.success(result))
        } catch {
            completion(.failure(AuthError.appleSignInFailed))
        }
    }
    
    func signOut(completion: (Result<Void, Error>) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(.success(()))
        } catch {
            completion(.failure(AuthError.signOutFailed))
        }
    }
}
