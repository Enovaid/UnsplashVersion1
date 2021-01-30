//
//  AuthService.swift
//  OneLabe-Twitter
//
//  Created by admin on 12/30/20.
//

import Foundation

protocol AuthService {
    func login(by password: String)
    func logout()
    func signUp(by phoneNumber: String)
}

final class AuthServiceImpl: AuthService {
    func login(by password: String) {
        // TODO: Logic for login
    }

    func logout() {
        // TODO: Logic for logout
    }

    func signUp(by phoneNumber: String) {
        // TODO: Logic for signUp
    }
}
