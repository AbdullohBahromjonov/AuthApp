//
//  GetTokenImpl.swift
//  AuthApp
//
//  Created by Abdulloh Bahromjonov on 07/09/25.
//

import Foundation

final class GetTokenImpl: GetTokenRepository {
    private let dataSource: GetTokenDataSource
    
    init(dataSource: GetTokenDataSource = GetTokenDataSource()) {
        self.dataSource = dataSource
    }
    
    func getToken(idToken: String) async throws -> String{
        try await dataSource.getToken(idToken: idToken)
    }
}
