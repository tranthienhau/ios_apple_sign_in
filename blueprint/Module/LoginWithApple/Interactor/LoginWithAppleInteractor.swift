//
//  LoginWithAppleInteractor.swift
//  blueprint
//
//  Created by DatNguyen on 31/07/2021.
//

import Foundation
import AuthenticationServices

protocol LoginWithAppleInteractorProtocol {
    func loginWithApple()
}

class LoginWithAppleInteractor: NSObject {
    weak var presenter: LoginWithApplePresenterProtocol?

    override init() {
    }
}

extension LoginWithAppleInteractor: LoginWithAppleInteractorProtocol {
    func loginWithApple() {
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

// swiftlint:disable line_length
extension LoginWithAppleInteractor : ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
// swiftlint:enable line_length
    @available(iOS 13.0, *)
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        // swiftlint:disable force_cast
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.window!
        // swiftlint:enable force_cast
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
        presenter?.completeLoginApple(response: reponseLogin, error: nil)
    }
    @available(iOS 13.0, *)
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Error login Apple : \(error.localizedDescription)")
        presenter?.completeLoginApple(response: nil, error: error)
    }
}
