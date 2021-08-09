//
//  BuilderLoginWithApple.swift
//  blueprint
//
//  Created by DatNguyen on 31/07/2021.
//

import UIKit

struct BuilderLoginWithApple {
    static func buildModule() -> UIViewController {
        let view = LoginWithAppleView(nibName: "LoginWithAppleView", bundle: nil)

        // MARK: Initialise components.

        let router = LoginWithAppleRouter(viewController: view)
        let loginAppleService = LoginAppleSerVice(contextProvider: router)
        let interactor = LoginWithAppleInteractor(loginService: loginAppleService)
        loginAppleService.authorizationController = interactor
        let presenter = LoginWithApplePresenter(view: view, interactor: interactor, router: router)

        // MARK: link Viper components.

        // Setup View
        view.presenter = presenter
        // Setup Interactor
        interactor.presenter = presenter

        return view
    }
}
