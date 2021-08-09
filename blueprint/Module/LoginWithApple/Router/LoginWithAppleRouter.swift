//
//  LoginWithAppleRouter.swift
//  blueprint
//
//  Created by DatNguyen on 31/07/2021.
//

import UIKit

protocol LoginWithAppleRouterProtocol {
    func gotoHomeView(param: ResponseLoginApple)
}

class LoginWithAppleRouter {
    private weak var viewController: UIViewController!

    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension LoginWithAppleRouter: LoginWithAppleRouterProtocol {
    func gotoHomeView(param: ResponseLoginApple) {
        let homeView = BuilderHome.buildModule(responseLogin: param)
        viewController.navigationController?.pushViewController(homeView, animated: true)
    }
}

extension LoginWithAppleRouter : AppleServicePresentationContextProviding {
    func getWindow() -> UIWindow {
        return viewController.view.window!
    }
}
