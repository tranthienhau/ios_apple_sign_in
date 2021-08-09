//
//  HomeInteractor.swift
//  blueprint
//
//  Created by DatNguyen on 31/07/2021.
//

import Foundation

protocol HomeInteractorProtocol: AnyObject {}

class HomeInteractor {
    weak var presenter: HomePresenterProtocol?
    init() {}
}

extension HomeInteractor: HomeInteractorProtocol {}
