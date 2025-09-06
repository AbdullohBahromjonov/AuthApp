//
//  AuthManager.swift
//  AuthApp
//
//  Created by Abdulloh Bahromjonov on 07/09/25.
//

import Foundation

class KeychainService {
    static let shared: KeychainService = KeychainService()
    
    private var keyIdToken: String { "idTokenKey" }
    private var keyToken: String { "tokenKey" }
    private var keyDeviceId: String { "passKey"}
    private let defaults = UserDefaults.standard
    
    private init() {}
    
    var idToken: String? {
        get {
            guard let idToken = defaults.string(forKey: keyIdToken) else { return nil }
            return idToken
        }
        set {
            guard let _ = newValue else { return removeToken() }
            defaults.setValue(newValue, forKey: keyIdToken)
        }
    }
    
    var token: String? {
        get {
            guard let token = defaults.string(forKey: keyToken) else { return nil }
            return token
        }
        set {
            guard let _ = newValue else { return removeToken()}
            defaults.setValue(newValue, forKey: keyToken)
        }
    }
    
    var deviceId: String? {
        get {
            guard let id = defaults.string(forKey: keyDeviceId) else { return nil }
            return id
        }
        set {
            defaults.setValue(newValue, forKey: keyDeviceId)
        }
    }
    
    func removeToken() {
        defaults.removeObject(forKey: keyIdToken)
        defaults.removeObject(forKey: keyToken)
    }
    
    func clearTokens() {
        removeToken()
    }
    
    func logout() {
        clearTokens()
    }
}
