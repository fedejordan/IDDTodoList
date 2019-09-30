//
//  UserDTO.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 30/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

struct UserDTO {
    let id: String
    let username: String
    let password: String

    func toUser() -> User {
        return User(id: id, username: username, password: password)
    }
}
