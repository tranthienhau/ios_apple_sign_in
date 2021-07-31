//
//  BuilderHome.swift
//  blueprint
//
//  Created by DatNguyen on 31/07/2021.
//

import UIKit

struct BuilderHome {
    static func buildModule(responseLogin: ResponseLoginApple) -> UIViewController {
        let view = HomeView(nibName: "HomeView", bundle: nil)

        // MARK: Initialise components.
        let interactor = HomeInteractor()
        let router = HomeRouter(viewController: view)
        let presenter = HomePresenter(view: view,
                                      interactor: interactor,
                                      router: router,
                                      responseLogin: responseLogin)

        // MARK: link Viper components.
        // Setup View
        view.presenter = presenter
        // Setup Interactor
        interactor.presenter = presenter

        return view
    }
}
