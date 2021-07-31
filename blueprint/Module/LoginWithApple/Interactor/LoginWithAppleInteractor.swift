//
//  LoginWithAppleInteractor.swift
//  blueprint
//
//  Created by DatNguyen on 31/07/2021.
//

import Foundation

protocol LoginWithAppleInteractorProtocol {}

class LoginWithAppleInteractor {
    weak var presenter: LoginWithApplePresenterProtocol?

    init() {
    }

}

extension LoginWithAppleInteractor: LoginWithAppleInteractorProtocol {}
