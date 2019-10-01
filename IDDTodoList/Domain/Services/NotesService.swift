//
//  NotesService.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 25/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

protocol NotesService {
    func getAllNotes(completion: ([Note]) -> Void)
    func createNote(with title: String, completion: (Bool) -> Void)
    func delete(note: Note, completion: (Bool) -> Void)
    func edit(note: Note, with title: String, completion: @escaping (Note?) -> Void)
}

class DefaultNotesService: NotesService {

    let notesRepository: NotesRepository
    let authenticationService: AuthenticationService

    init(notesRepository: NotesRepository,
         authenticationService: AuthenticationService) {
        self.notesRepository = notesRepository
        self.authenticationService = authenticationService
    }

    func getAllNotes(completion: ([Note]) -> Void) {
        authenticationService.getCurrentSession { session in
            if let session = session {
                let userId = session.userId
                self.notesRepository.getNotes(for: userId, completion: completion)
            }
        }
    }

    func createNote(with title: String, completion: (Bool) -> Void) {
        authenticationService.getCurrentSession { session in
            if let session = session {
                let userId = session.userId
                let note = Note(id: UUID().uuidString, title: title, userId: userId) // ID can be created in a isolated service
                self.notesRepository.add(note: note, completion: completion)
            }
        }
    }

    func delete(note: Note, completion: (Bool) -> Void) {
        notesRepository.delete(note: note, completion: completion)
    }

    func edit(note: Note, with title: String, completion: @escaping (Note?) -> Void) {
        notesRepository.update(note: note, with: title) { result in
            self.notesRepository.getNote(with: note.id) { note in
                completion(note)
            }
        }
    }

}
