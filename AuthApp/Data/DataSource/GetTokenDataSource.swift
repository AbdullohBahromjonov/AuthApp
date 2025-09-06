//
//  GetTokenDataSource.swift
//  AuthApp
//
//  Created by Abdulloh Bahromjonov on 07/09/25.
//


final class GetTokenDataSource {
    func getToken(idToken: String) async throws -> String {
        let body = [
            "jsonrpc": "2.0",
            "method": "auth.firebaseLogin",
            "params": [
                "fbIdToken": "<Firebase_idToken>"
            ],
            "id": 1
        ] as [String : Any]
        let headers: [String: String] = [
            "Content-Type": "application/json"
        ]
        
        let response = try await NetworkService.shared.post(
            url: "https://api.court360.ai/rpc/client",
            body: body,
            headers: headers,
            responseType: TokenResponse.self
        )
        
        return response.result.accessToken
    }
}
