//
//  NotesListPresenter.swift
//  IDDTodoListTests
//
//  Created by Federico Jordan on 25/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import Foundation

protocol NotesListPresenterCoordinator: class {
    func shouldShowAddNote()
    func shouldShowEdit(for note: Note)
    func goBack()
}

protocol NotesListPresenterViewControllable: class {
    func updateNotes()
}

class NotesListPresenter {
    weak var viewController: NotesListPresenterViewControllable?
    var coordinator: NotesListPresenterCoordinator?

    let getNotes: GetNotes
    let deleteNote: DeleteNote
    let logoutUser: LogoutUser

    var notes: [Note] = []
    var notesCount: Int {
        return notes.count
    }

    init(getNotes: GetNotes,
         deleteNote: DeleteNote,
         logoutUser: LogoutUser) {
        self.getNotes = getNotes
        self.deleteNote = deleteNote
        self.logoutUser = logoutUser
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
        coordinator?.shouldShowAddNote()
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
        coordinator?.shouldShowEdit(for: note)
    }

    func didTapLogout() {
        logoutUser.execute { result in
            if result { self.coordinator?.goBack() }
        }
    }
}

extension NotesListPresenter: NotesListCoordinatorPresentable {
    func shouldUpdateList() {
        reloadNotes()
    }

}
