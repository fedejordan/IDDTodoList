//
//  AuthenticationService.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 30/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

protocol AuthenticationService {
    func login(with username: String, password: String, completion: (Bool) -> Void)
    func logout(completion: (Bool) -> Void)
    func getCurrentSession(completion: (Session?) -> Void)
    func signUp(with username: String, password: String, confirmPassword: String, completion: (Bool) -> Void)
}

class DefaultAuthenticationService: AuthenticationService {
    let sessionsRepository: SessionsRepository
    let usersService: UsersService

    init(usersService: UsersService, sessionsRepository: SessionsRepository) {
        self.usersService = usersService
        self.sessionsRepository = sessionsRepository
    }

    func login(with username: String, password: String, completion: (Bool) -> Void) {
        usersService.getUser(for: username) { user in
            if let user = user, user.password == password {
                self.sessionsRepository.create(for: user.id) { session in
                    let success = session != nil
                    completion(success)
                }
            } else {
                completion(false)
            }
        }
    }

    func logout(completion: (Bool) -> Void) {
        sessionsRepository.deleteSession(completion: completion)
    }

    func signUp(with username: String, password: String, confirmPassword: String, completion: (Bool) -> Void) {
        if password == confirmPassword {
            usersService.createUser(with: username, password: password) { user in
                if let user = user {
                    self.sessionsRepository.create(for: user.id, completion: { session in
                        let success = session != nil
                        completion(success)
                    })
                } else {
                    completion(false)
                }
            }
        } else {
            completion(false)
        }
    }

    func getCurrentSession(completion: (Session?) -> Void) {
        sessionsRepository.getCurrent(completion: completion)
    }

}
