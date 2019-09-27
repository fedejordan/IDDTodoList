//
//  NotesListPresenter.swift
//  IDDTodoListTests
//
//  Created by Federico Jordan on 25/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import Foundation

protocol NotesListPresenterNavigator: class {
    func shouldShowAddNote()
    func shouldShowEdit(for note: Note)
}

protocol NotesListPresenterViewControllable: class {
    func updateNotes()
}

class NotesListPresenter {
    weak var viewController: NotesListPresenterViewControllable?
    var navigator: NotesListPresenterNavigator?

    let getNotes: GetNotes
    let deleteNote: DeleteNote

    var notes: [Note] = []
    var notesCount: Int {
        return notes.count
    }

    init(getNotes: GetNotes,
         deleteNote: DeleteNote) {
        self.getNotes = getNotes
        self.deleteNote = deleteNote
    }

    // MARK:- Utils
    private func reloadNotes() {
        getNotes.execute { notes in
            self.notes = notes
            self.viewController?.updateNotes()
        }
    }
}

extension NotesListPresenter: NotesListViewControllerListener {

    func didLoad() {
        reloadNotes()
    }

    func didTapAddNote() {
        navigator?.shouldShowAddNote()
    }

    func didSelectDeleteNote(at index: Int) {
        let note = notes[index]
        deleteNote.execute(note: note) { result in
            reloadNotes()
        }
    }

    func note(at index: Int) -> NoteViewModel {
        return NoteViewModel(note: notes[index])
    }

    func didSelectEditNote(at index: Int) {
        let note = notes[index]
        navigator?.shouldShowEdit(for: note)
    }
}

extension NotesListPresenter: NotesListCoordinatorPresentable {
    func shouldUpdateList() {
        reloadNotes()
    }

}
