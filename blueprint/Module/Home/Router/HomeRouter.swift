//
//  HomeRouter.swift
//  blueprint
//
//  Created by DatNguyen on 31/07/2021.
//

import UIKit

protocol HomeRouterProtocol: AnyObject {
    func backtoLoginView()
}

class HomeRouter {
    private weak var viewController: UIViewController?

    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension HomeRouter: HomeRouterProtocol {
    func backtoLoginView() {
        viewController?.navigationController?.popToRootViewController(animated: false)
    }
}
