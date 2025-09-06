//
//  GetTokenUseCase.swift
//  AuthApp
//
//  Created by Abdulloh Bahromjonov on 07/09/25.
//

import Foundation

struct GetTokenUseCase {
    private let repository: GetTokenRepository
    
    init(repository: GetTokenRepository = GetTokenImpl()) {
        self.repository = repository
    }
    
    func getToken(idToken: String) async throws -> String {
        try await repository.getToken(idToken: idToken)
    }
}
