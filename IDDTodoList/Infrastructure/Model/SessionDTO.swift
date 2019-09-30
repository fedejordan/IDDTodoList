//
//  SessionDTO.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 30/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

struct SessionDTO {
    let sessionId: String
    let userId: String

    func toSession() -> Session {
        return Session(sessionId: sessionId, userId: userId)
    }
}
