//
//  ResponseLoginApple.swift
//  blueprint
//
//  Created by DatNguyen on 31/07/2021.
//

import Foundation

struct ResponseLoginApple {
    var id: String?
    var appleId: String?
    var email: String?
    var firstName: String?
    var lastName: String?
    var code: String?

    init(id: String, appleId: String, email: String, firstName: String, lastName: String, code: String) {
        self.id = id
        self.appleId = appleId
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.code = code
    }
}
