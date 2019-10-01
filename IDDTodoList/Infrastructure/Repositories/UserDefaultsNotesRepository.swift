//
//  UserDefaultsNotesRepository.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 30/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

class UserDefaultsNotesRepository: NotesRepository {

    func getNotes(for userId: String, completion: ([Note]) -> Void) {
        let numberOfIds  = UserDefaults.standard.integer(forKey: "number_of_ids")
        var notes: [Note] = []

        for i in 0..<numberOfIds {
            if let id = UserDefaults.standard.string(forKey: "note_id_\(i)") {
                if let title = UserDefaults.standard.string(forKey: noteTitleKey(for: id)),
                    let noteUserId = UserDefaults.standard.string(forKey: noteUserIdKey(for: id)),
                    noteUserId == userId {
                    notes.append(Note(id: id, title: title, userId: userId))
                }
            }
        }
        completion(notes)
    }

    func add(note: Note, completion: (Bool) -> Void) {
        let numberOfIds  = UserDefaults.standard.integer(forKey: "number_of_ids")
        UserDefaults.standard.set(note.title, forKey: noteTitleKey(for: note.id))
        UserDefaults.standard.set(note.userId, forKey: noteUserIdKey(for: note.id))
        UserDefaults.standard.set(note.id, forKey: "note_id_\(numberOfIds)")
        UserDefaults.standard.set(numberOfIds+1, forKey: "number_of_ids")
        UserDefaults.standard.synchronize()
        completion(true)
    }

    func delete(note: Note, completion: (Bool) -> Void) {
        UserDefaults.standard.set(nil, forKey: noteTitleKey(for: note.id))
        UserDefaults.standard.synchronize()
        completion(true)
    }

    func update(note: Note, with title: String, completion: (Bool) -> Void) {
        UserDefaults.standard.set(note.title, forKey: noteTitleKey(for: note.id))
        UserDefaults.standard.synchronize()
        completion(true)
    }

    func getNote(with id: String, completion: (Note?) -> Void) {
        guard
            let title = UserDefaults.standard.string(forKey: noteTitleKey(for: id)),
            let userId = UserDefaults.standard.string(forKey: noteUserIdKey(for: id))
        else { return completion(nil) }
        completion(Note(id: id, title: title, userId: userId))
    }

    private func noteTitleKey(for noteId: String) -> String {
        return "note_\(noteId)_title"
    }

    private func noteUserIdKey(for noteId: String) -> String {
        return "note_\(noteId)_userid"
    }


}
