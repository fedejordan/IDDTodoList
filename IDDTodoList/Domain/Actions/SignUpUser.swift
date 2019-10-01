//
//  SignUpUser.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 01/10/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

protocol SignUpUser {
    func execute(with username: String, password: String, confirmPassword: String, completion: (Bool) -> Void)
}

class DefaultSignUpUser: SignUpUser {

    let authenticationService: AuthenticationService

    init(authenticationService: AuthenticationService) {
        self.authenticationService = authenticationService
    }

    func execute(with username: String, password: String, confirmPassword: String, completion: (Bool) -> Void) {
        authenticationService.signUp(with: username, password: password, confirmPassword: confirmPassword, completion: completion)
    }
}
