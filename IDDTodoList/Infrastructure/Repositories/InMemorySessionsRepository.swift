//
//  InMemorySessionsRepository.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 30/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

class InMemorySessionsRepository: SessionsRepository {

    private var sessions: [SessionDTO] = []

    func create(for userId: String, completion: (Session?) -> Void) {
        let newSession = SessionDTO(sessionId: UUID().uuidString, userId: userId)
        sessions.append(newSession)
        completion(newSession.toSession())
    }


}


