//
//  LoginWithApplePresenter.swift
//  blueprint
//
//  Created by DatNguyen on 31/07/2021.
//

import Foundation

protocol LoginWithApplePresenterProtocol: AnyObject {
    func tapButtonLoginWithApple()
    func completeLoginApple(response: Result<ResponseLoginApple, Error>)
}

class LoginWithApplePresenter {
    private weak var view: LoginWithAppleViewProtocol?
    private var interactor: LoginWithAppleInteractorProtocol
    private var router: LoginWithAppleRouterProtocol

    init(view: LoginWithAppleViewProtocol,
         interactor: LoginWithAppleInteractorProtocol,
         router: LoginWithAppleRouterProtocol)
    {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension LoginWithApplePresenter: LoginWithApplePresenterProtocol {
    func tapButtonLoginWithApple() {
        interactor.loginWithApple()
    }

    func completeLoginApple(response: Result<ResponseLoginApple, Error>) {
        switch response {
        case .success(let data):
            router.gotoHomeView(param: data)
        case .failure(let error):
            view?.showError(message: error.localizedDescription)
        }
    }
}
