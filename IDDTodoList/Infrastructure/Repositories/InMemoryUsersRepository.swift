//
//  InMemoryUsersRepository.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 30/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

class InMemoryUsersRepository: UsersRepository {

    private var users: [UserDTO] = [
        UserDTO(id: UUID().uuidString,
                username: "fede",
                password: "1234")
    ]


    func getUser(for username: String, completion: (User?) -> Void) {
        let filteredUsers = users.filter { $0.username == username }
        if let user = filteredUsers.first?.toUser() {
            completion(user)
        } else {
            completion(nil)
        }
    }


}
