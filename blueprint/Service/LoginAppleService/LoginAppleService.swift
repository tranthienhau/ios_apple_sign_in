//
//  LoginAppleService.swift
//  blueprint
//
//  Created by DatNguyen on 03/08/2021.
//

import AuthenticationServices
import Foundation

class LoginAppleSerVice: NSObject, LoginAppleServiceProtocol {
    
    private let contextProvider: AppleServicePresentationContextProviding
    weak var authorizationController: AppleServiceAuthorizationController?
    init(contextProvider: AppleServicePresentationContextProviding) {
        self.contextProvider = contextProvider
    }

    func loginApple() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.presentationContextProvider = self
        authorizationController.delegate = self
        authorizationController.performRequests()
    }
}

extension LoginAppleSerVice: ASAuthorizationControllerPresentationContextProviding {
    // swiftlint:enable line_length
    func presentationAnchor(for _: ASAuthorizationController) -> ASPresentationAnchor {
        return contextProvider.getWindow()
    }
}

extension LoginAppleSerVice : ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController,
                                 didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential
        else { return }
        let id:String = appleIDCredential.user
        let email:String = appleIDCredential.email ?? ""
        let lname:String = appleIDCredential.fullName?.familyName ?? ""
        let fname:String = appleIDCredential.fullName?.givenName ?? ""
        let nName: String = appleIDCredential.fullName?.nickname ?? ""
        let name1: String = appleIDCredential.fullName?.namePrefix ?? ""
        let name2: String = appleIDCredential.fullName?.nameSuffix ?? ""
        let appleId:String = appleIDCredential.identityToken?.base64EncodedString() ?? ""
        let code:String = String(data: appleIDCredential.authorizationCode!, encoding: .utf8) ?? ""
        // Call API Login
        let reponseLogin = ResponseLoginApple(id: id,
                                              appleId: appleId,
                                              email: email,
                                              firstName: fname,
                                              lastName: lname,
                                              code: code)
        authorizationController?.finishLoginAppleWith(response: Result.success(reponseLogin))
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        authorizationController?.finishLoginAppleWith(response: Result.failure(error))
    }
}
