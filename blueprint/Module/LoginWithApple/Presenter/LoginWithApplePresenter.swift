//
//  LoginWithApplePresenter.swift
//  blueprint
//
//  Created by DatNguyen on 31/07/2021.
//

import Foundation

protocol LoginWithApplePresenterProtocol: AnyObject {
    func loginSuccess(response: ResponseLoginApple)
}

class LoginWithApplePresenter {
    private weak var view: LoginWithAppleViewProtocol?
    private var interactor: LoginWithAppleInteractorProtocol
    private var router: LoginWithAppleRouterProtocol

    init(view: LoginWithAppleViewProtocol,
         interactor: LoginWithAppleInteractorProtocol,
         router: LoginWithAppleRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension LoginWithApplePresenter: LoginWithApplePresenterProtocol {
    func loginSuccess(response: ResponseLoginApple) {
        router.gotoHomeView(param: response)
    }
}
