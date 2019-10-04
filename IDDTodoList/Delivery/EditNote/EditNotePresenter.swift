//
//  EditNotePresenter.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 27/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

protocol EditNotePresenterCoordinator {
    func goBack()
}

class EditNotePresenter {
    let editNote: EditNote
    var note: Note!
    var coordinator: EditNotePresenterCoordinator!

    init(editNote: EditNote) {
        self.editNote = editNote
    }
}

extension EditNotePresenter: EditNoteViewControllerListener {

    func didTapConfirmEdit(with title: String) {
        editNote.execute(for: note, with: title) { result in
            self.coordinator.goBack()
        }
    }

}
