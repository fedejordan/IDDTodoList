//
//  UsersService.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 30/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

protocol UsersService {
    func getUser(forUserId userId: String, completion: (User?) -> Void)
    func getUser(for username: String, completion: (User?) -> Void)
    func createUser(with username: String, password: String, completion: (User?) -> Void)
}

class DefaultUsersService: UsersService {

    let usersRepository: UsersRepository

    init(usersRepository: UsersRepository) {
        self.usersRepository = usersRepository
    }

    func getUser(forUserId userId: String, completion: (User?) -> Void) {
        usersRepository.getUser(forUserId: userId, completion: completion)
    }

    func getUser(for username: String, completion: (User?) -> Void) {
        usersRepository.getUser(for: username, completion: completion)
    }

    func createUser(with username: String, password: String, completion: (User?) -> Void) {
        usersRepository.createUser(with: username, password: password, completion: completion)
    }
}
