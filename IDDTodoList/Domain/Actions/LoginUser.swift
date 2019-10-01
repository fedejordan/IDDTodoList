//
//  LoginUser.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 30/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

protocol LoginUser {
    func execute(username: String, password: String, completion: (Bool) -> Void)
}

class DefaultLoginUser: LoginUser {

    let authenticationService: AuthenticationService

    init(authenticationService: AuthenticationService) {
        self.authenticationService = authenticationService
    }

    func execute(username: String, password: String, completion: (Bool) -> Void) {
        authenticationService.login(with: username, password: password, completion: completion)
    }
}
