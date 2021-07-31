//
//  HomePresenter.swift
//  blueprint
//
//  Created by DatNguyen on 31/07/2021.
//

import Foundation

protocol HomePresenterProtocol: AnyObject {
    func onViewDidLoad()
}

class HomePresenter {

    private var responseLogin: ResponseLoginApple?
    private weak var view: HomeViewProtocol?
    private var interactor: HomeInteractorProtocol
    private var router: HomeRouterProtocol

    init(view: HomeViewProtocol,
         interactor: HomeInteractorProtocol,
         router: HomeRouterProtocol,
         responseLogin: ResponseLoginApple) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.responseLogin = responseLogin
    }
}

extension HomePresenter : HomePresenterProtocol {
    func onViewDidLoad() {
        guard let dataLogin = responseLogin else {return}
        let homeEntity = HomeEntity(id: dataLogin.id ?? "",
                                    email: dataLogin.email ?? "",
                                    fullName: (dataLogin.firstName ?? "") + " " + (dataLogin.lastName ?? ""))
        view?.updateUI(param: homeEntity)
    }
}
