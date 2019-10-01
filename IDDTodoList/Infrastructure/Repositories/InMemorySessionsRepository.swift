//
//  InMemorySessionsRepository.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 30/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

class InMemorySessionsRepository: SessionsRepository {

    private var currentSession: SessionDTO? = nil

    func create(for userId: String, completion: (Session?) -> Void) {
        let newSession = SessionDTO(sessionId: UUID().uuidString, userId: userId)
        currentSession = newSession
        completion(newSession.toSession())
    }

    func deleteSession(completion: (Bool) -> Void) {
        currentSession = nil
        completion(true)
    }

    func getCurrent(completion: (Session?) -> Void) {
        completion(currentSession?.toSession())
    }

}


