//
//  InMemoryNotesRepository.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 26/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

class InMemoryNotesRepository: NotesRepository {

    private var notes: [NoteDTO] = []

    func getNotes(completion: ([Note]) -> Void) {
        let notes = self.notes.map { $0.toNote() }
        completion(notes)
    }

    func add(note: Note, completion: (Bool) -> Void) {
        notes.append(noteDTO(from: note))
        completion(true)
    }

    func delete(note: Note, completion: (Bool) -> Void) {
        notes = notes.filter { $0.id != note.id }
        completion(true)
    }

    func update(note: Note, with title: String, completion: (Bool) -> Void)  {
        let index = notes.firstIndex { $0.id == note.id }
        if let index = index {
            let newNote = Note(id: note.id, title: title)
            notes[index] = noteDTO(from: newNote)
            completion(true)
        }
    }

    func getNote(with id: String, completion: (Note?) -> Void) {
        let note = notes.filter { $0.id == id } .first?.toNote()
        completion(note)
    }

    private func noteDTO(from note: Note) -> NoteDTO {
        return NoteDTO(id: note.id, title: note.title)
    }
}
