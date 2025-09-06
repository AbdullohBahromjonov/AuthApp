//
//  NetworkError.swift
//  AuthApp
//
//  Created by Abdulloh Bahromjonov on 07/09/25.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidURL
    case encodingError
    case httpError(Int)
    case decodingError(String)
    case noData
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .encodingError:
            return "Failed to encode request body"
        case .httpError(let code):
            return "HTTP Error: \(code)"
        case .decodingError(let message):
            return "Decoding error: \(message)"
        case .noData:
            return "No data received"
        }
    }
}
