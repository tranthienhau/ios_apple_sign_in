//
//  LoginWithAppleView.swift
//  blueprint
//
//  Created by DatNguyen on 31/07/2021.
//

import UIKit
import AuthenticationServices

protocol LoginWithAppleViewProtocol: AnyObject {}

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
        } else {
        }
    }

    // MARK: - Button Action 
    @objc func handleAuthorizationAppleIDButtonPress() {
        if #available(iOS 13.0, *) {
            let appleIDProvider = ASAuthorizationAppleIDProvider()
            let request = appleIDProvider.createRequest()
            request.requestedScopes = [.fullName, .email]
            let authorizationController = ASAuthorizationController(authorizationRequests: [request])
            authorizationController.presentationContextProvider = self
            authorizationController.delegate = self
            authorizationController.performRequests()
        } else {
            // Fallback on earlier versions
        }
    }

}

extension LoginWithAppleView : LoginWithAppleViewProtocol {}

// swiftlint:disable line_length
extension LoginWithAppleView : ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
// swiftlint:enable line_length
    @available(iOS 13.0, *)
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    @available(iOS 13.0, *)
    func authorizationController(controller: ASAuthorizationController,
                                 didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential
        else { return }
        let id:String = appleIDCredential.user
        let email:String = appleIDCredential.email ?? ""
        let lname:String = appleIDCredential.fullName?.familyName ?? ""
        let fname:String = appleIDCredential.fullName?.givenName ?? ""
        let appleId:String = appleIDCredential.identityToken?.base64EncodedString() ?? ""
        let code:String = String(data: appleIDCredential.authorizationCode!, encoding: .utf8) ?? ""
        // Call API Login
        let reponseLogin = ResponseLoginApple(id: id,
                                              appleId: appleId,
                                              email: email,
                                              firstName: fname,
                                              lastName: lname,
                                              code: code)
        presenter?.loginSuccess(response: reponseLogin)
    }
    @available(iOS 13.0, *)
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Error login Apple : \(error.localizedDescription)")
        lbError.text = "Error login Apple : \(error.localizedDescription)"
    }
}
