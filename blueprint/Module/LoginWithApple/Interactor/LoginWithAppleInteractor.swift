//
//  LoginWithAppleInteractor.swift
//  blueprint
//
//  Created by DatNguyen on 31/07/2021.
//

import AuthenticationServices
import Foundation

protocol LoginWithAppleInteractorProtocol {
    func loginWithApple()
}

class LoginWithAppleInteractor {
    weak var presenter: LoginWithApplePresenterProtocol?
    private let loginAppleService: LoginAppleServiceProtocol

    init(loginService: LoginAppleServiceProtocol) {
        loginAppleService = loginService
    }
}

extension LoginWithAppleInteractor: LoginWithAppleInteractorProtocol {
    func loginWithApple() {
        loginAppleService.loginApple()
    }
}

extension LoginWithAppleInteractor: AppleServiceAuthorizationController {
    func finishLoginAppleWith(response: Result<ResponseLoginApple, Error>) {
        presenter?.completeLoginApple(response: response)
    }
}
