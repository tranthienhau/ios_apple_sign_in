//
//  HomeEntity.swift
//  blueprint
//
//  Created by DatNguyen on 31/07/2021.
//

import Foundation
// Change Name Model
struct HomeUserInforModel {
    var id: String?
    var email: String?
    var fullName: String?

    init(id: String, email: String, fullName: String) {
        self.id = id
        self.email = email
        self.fullName = fullName
    }
}
