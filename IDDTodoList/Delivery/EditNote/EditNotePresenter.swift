//
//  EditNotePresenter.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 27/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

protocol EditNotePresenterNavigator {
    func goBack()
}

class EditNotePresenter {
    let editNote: EditNote
    var note: Note!
    var navigator: EditNotePresenterNavigator!

    init(editNote: EditNote) {
        self.editNote = editNote
    }
}

extension EditNotePresenter: EditNoteViewControllerListener {

    func didTapConfirmEdit(with title: String) {
        editNote.execute(for: note, with: title) { result in
            self.navigator.goBack()
        }
    }

}
