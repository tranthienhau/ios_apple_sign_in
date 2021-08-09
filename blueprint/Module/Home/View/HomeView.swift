//
//  HomeView.swift
//  blueprint
//
//  Created by DatNguyen on 31/07/2021.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    func updateUI(param: HomeUserInforModel)
}

class HomeView: UIViewController {
    
    @IBOutlet weak var lbEmail: UILabel!
    @IBOutlet weak var lbFullName: UILabel!
    @IBOutlet weak var lbBirthDate: UILabel!
    @IBOutlet weak var lbAdress: UILabel!
    
    var presenter: HomePresenterProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onViewDidLoad()
    }
    
    //MARK: - Button Action
    @IBAction func btnLogout_Action(_ sender: UIButton) {
        presenter.tapButtonLogout()
    }
    
}

extension HomeView: HomeViewProtocol {
    func updateUI(param: HomeUserInforModel) {
        
        lbEmail.text = param.email != "" ? param.email : param.id
        
        if let fullname = param.fullName {
            lbFullName.text = fullname
        }
    }
}
