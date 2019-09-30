//
//  AuthenticationService.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 30/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

protocol AuthenticationService {
    func login(with username: String, password: String, completion: (Session?) -> Void)
}

class DefaultAuthenticationService: AuthenticationService {
    let sessionsRepository: SessionsRepository
    let usersService: UsersService

    init(usersService: UsersService, sessionsRepository: SessionsRepository) {
        self.usersService = usersService
        self.sessionsRepository = sessionsRepository
    }

    func login(with username: String, password: String, completion: (Session?) -> Void) {
        usersService.getUser(for: username) { user in
            if let user = user, user.password == password {
                self.sessionsRepository.create(for: user.id) { session in
                    completion(session)
                }
            } else {
                completion(nil)
            }
        }
    }

}
