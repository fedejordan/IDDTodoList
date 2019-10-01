//
//  NotesListCoordinator.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 25/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

protocol NotesListCoordinatorPresentable: class {
    func shouldUpdateList()
}

class NotesListCoordinator: NSObject {

    weak var viewController: UIViewController?
    weak var presenter: NotesListCoordinatorPresentable?
    let addNoteBuilder: AddNoteBuilder
    let editNoteBuilder: EditNoteBuilder

    init(addNoteBuilder: AddNoteBuilder, editNoteBuilder: EditNoteBuilder) {
        self.addNoteBuilder = addNoteBuilder
        self.editNoteBuilder = editNoteBuilder
    }

}

extension NotesListCoordinator: NotesListPresenterNavigator {

    func shouldShowAddNote() {
        let addNoteViewController = addNoteBuilder.flowViewController(coordinatorListener: self)
        viewController?.show(addNoteViewController, sender: nil)
    }

    func shouldShowEdit(for note: Note) {
        let editNoteViewController = editNoteBuilder.flowViewController(coordinatorListener: self, note: note)
        viewController?.show(editNoteViewController, sender: nil)
    }

    func goBack() {
        viewController?.dismiss(animated: true, completion: nil)
    }

}

extension NotesListCoordinator: AddNoteCoordinatorListener {

    func didAddNote() {
        presenter?.shouldUpdateList()
    }

}

extension NotesListCoordinator: EditNoteNavigatorListener {

    func didUpdateNote() {
        presenter?.shouldUpdateList()
    }

}
