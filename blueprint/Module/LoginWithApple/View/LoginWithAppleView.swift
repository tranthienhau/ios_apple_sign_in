//
//  LoginWithAppleView.swift
//  blueprint
//
//  Created by DatNguyen on 31/07/2021.
//

import AuthenticationServices
import UIKit

protocol LoginWithAppleViewProtocol: AnyObject {
    func showError(message: String)
}

class LoginWithAppleView: UIViewController {
    @IBOutlet var vLoginWithApple: UIView!
    @IBOutlet var lcWidthViewApple: NSLayoutConstraint!
    @IBOutlet var lcHeightViewApple: NSLayoutConstraint!
    @IBOutlet var lbError: UILabel!
    var presenter: LoginWithApplePresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        let authenAppleButton = ASAuthorizationAppleIDButton()
        authenAppleButton.addTarget(self,
                                    action: #selector(handleAuthorizationAppleIDButtonPress),
                                    for: .touchUpInside)
        lcWidthViewApple.constant = authenAppleButton.bounds.size.width
        lcHeightViewApple.constant = authenAppleButton.bounds.size.height
        vLoginWithApple.layoutIfNeeded()
        vLoginWithApple.addSubview(authenAppleButton)
    }

    // MARK: - Button Action

    @objc func handleAuthorizationAppleIDButtonPress() {
        presenter?.tapButtonLoginWithApple()
    }
}

extension LoginWithAppleView: LoginWithAppleViewProtocol {
    func showError(message: String) {
        lbError.text = "Error login Apple : \(message)"
    }
}
