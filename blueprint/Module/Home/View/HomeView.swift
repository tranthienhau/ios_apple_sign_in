//
//  HomeView.swift
//  blueprint
//
//  Created by DatNguyen on 31/07/2021.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    func updateUI(param: HomeEntity)
}

class HomeView: UIViewController {

    @IBOutlet weak var lbInfor: UILabel!

    var presenter: HomePresenterProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onViewDidLoad()
    }
}

extension HomeView : HomeViewProtocol {
    func updateUI(param: HomeEntity) {
        let textId = "IdUser : \(param.id ?? "") \n"
        let textFullName = "FullName: \(param.fullName ?? "") \n"
        let textEmail = "Email: \(param.email ?? "")"
        lbInfor.text = textId + textFullName + textEmail
    }
}
