//
//  AddNotePresenter.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 26/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

protocol AddNotePresenterCoordinator {
    func goBack()
}

class AddNotePresenter {
    let createNote: CreateNote
    var coordinator: AddNotePresenterCoordinator?

    init(createNote: CreateNote) {
        self.createNote = createNote
    }

}

extension AddNotePresenter: AddNoteViewControllerListener {
    func didTapAddNote(with title: String) {
        createNote.execute(with: title) { (result) in
            self.coordinator?.goBack()
        }
    }


}
