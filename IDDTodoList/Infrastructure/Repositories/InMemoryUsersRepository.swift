//
//  InMemoryUsersRepository.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 30/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

class InMemoryUsersRepository: UsersRepository {

    private var users: [UserDTO] = []

    func getUser(forUserId userId: String, completion: (User?) -> Void) {
        let filteredUsers = users.filter { $0.id == userId }
        if let user = filteredUsers.first?.toUser() {
            completion(user)
        } else {
            completion(nil)
        }
    }

    func getUser(for username: String, completion: (User?) -> Void) {
        let filteredUsers = users.filter { $0.username == username }
        if let user = filteredUsers.first?.toUser() {
            completion(user)
        } else {
            completion(nil)
        }
    }

    func createUser(with username: String, password: String, completion: (User?) -> Void) {
        let user = UserDTO(id: UUID().uuidString, username: username, password: password)
        users.append(user)
        completion(user.toUser())
    }

}
