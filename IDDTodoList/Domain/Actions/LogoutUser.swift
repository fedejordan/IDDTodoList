//
//  LogoutUser.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 01/10/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

protocol LogoutUser {
    func execute(completion: (Bool) -> Void)
}

class DefaultLogoutUser: LogoutUser {

    let authenticationService: AuthenticationService

    init(authenticationService: AuthenticationService) {
        self.authenticationService = authenticationService
    }

    func execute(completion: (Bool) -> Void) {
        authenticationService.logout(completion: completion)
    }
}
