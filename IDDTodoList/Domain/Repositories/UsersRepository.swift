//
//  UsersRepository.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 30/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

protocol UsersRepository {
    func getUser(for username: String, completion: (User?) -> Void)
}
