//
//  GetTokenRepository.swift
//  AuthApp
//
//  Created by Abdulloh Bahromjonov on 07/09/25.
//

protocol GetTokenRepository {
    func getToken(idToken: String) async throws -> String
}
