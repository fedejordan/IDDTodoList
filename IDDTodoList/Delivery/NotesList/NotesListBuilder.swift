//
//  NotesListBuilder.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 25/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

protocol Builder {
    func flowViewController() -> UIViewController
}

class NotesListBuilder: Builder {

    let dependenciesContainer: DependenciesContainer

    init(dependenciesContainer: DependenciesContainer) {
        self.dependenciesContainer = dependenciesContainer
    }

    func flowViewController() -> UIViewController {
        let presenter = NotesListPresenter(getNotes: dependenciesContainer.getNotes,
                                           deleteNote: dependenciesContainer.deleteNote,
                                           logoutUser: dependenciesContainer.logoutUser)

        let viewController = NotesListViewController()
        presenter.viewController = viewController
        viewController.listener = presenter

        let navigator = NotesListCoordinator(addNoteBuilder: dependenciesContainer.addNoteBuilder, editNoteBuilder: dependenciesContainer.editNoteBuilder)
        presenter.navigator = navigator
        navigator.viewController = viewController
        navigator.presenter = presenter

        return viewController
    }

}
