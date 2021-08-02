//
//  LoginWithAppleView.swift
//  blueprint
//
//  Created by DatNguyen on 31/07/2021.
//

import UIKit
import AuthenticationServices

protocol LoginWithAppleViewProtocol: AnyObject {
    func showError(message: String)
}

class LoginWithAppleView: UIViewController {
    @IBOutlet weak var vLoginWithApple: UIView!
    @IBOutlet weak var lcWidthViewApple: NSLayoutConstraint!
    @IBOutlet weak var lcHeightViewApple: NSLayoutConstraint!
    @IBOutlet weak var lbError: UILabel!
    var presenter: LoginWithApplePresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        if #available(iOS 13.0, *) {
            let authenAppleButton = ASAuthorizationAppleIDButton()
            authenAppleButton.addTarget(self,
                                        action: #selector(handleAuthorizationAppleIDButtonPress),
                                        for: .touchUpInside)
            lcWidthViewApple.constant = authenAppleButton.bounds.size.width
            lcHeightViewApple.constant = authenAppleButton.bounds.size.height
            self.vLoginWithApple.layoutIfNeeded()
            self.vLoginWithApple.addSubview(authenAppleButton)
        } else {}
    }

    // MARK: - Button Action 
    @objc func handleAuthorizationAppleIDButtonPress() {
        presenter?.tapButtonLoginWithApple()
    }

}

extension LoginWithAppleView : LoginWithAppleViewProtocol {
    func showError(message: String) {
        lbError.text = "Error login Apple : \(message)"
    }
}
