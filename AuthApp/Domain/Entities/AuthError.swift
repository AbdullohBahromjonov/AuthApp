//
//  AuthError.swift
//  AuthApp
//
//  Created by Abdulloh Bahromjonov on 06/09/25.
//

import Foundation

enum AuthError: LocalizedError {
    case missingGoogleClientID
    case googleSignInFailed
    case appleSignInFailed
    case firebaseSignInFailed
    case signOutFailed
    case custom(String)

    var errorDescription: String? {
        switch self {
        case .missingGoogleClientID:
            return "Google Client ID is missing."
        case .googleSignInFailed:
            return "Google Sign-In failed. Please try again."
        case .appleSignInFailed:
            return "Apple Sign-In failed. Please try again."
        case .firebaseSignInFailed:
            return "Firebase authentication failed."
        case .signOutFailed:
            return "Sign out failed."
        case .custom(let message):
            return message
        }
    }
}
