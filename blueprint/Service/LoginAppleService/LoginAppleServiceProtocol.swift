//
//  LoginAppleServiceProtocol.swift
//  blueprint
//
//  Created by DatNguyen on 03/08/2021.
//

import UIKit

protocol LoginAppleServiceProtocol {
    func loginApple()
}

protocol AppleServicePresentationContextProviding {
    func getWindow() -> UIWindow
}

protocol AppleServiceAuthorizationController: AnyObject {
    func finishLoginAppleWith(response: Result<ResponseLoginApple, Error>)
}
