//
//  EditNoteBuilder.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 27/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

class EditNoteBuilder {
    let dependenciesContainer: DependenciesContainer

    init(dependenciesContainer: DependenciesContainer) {
        self.dependenciesContainer = dependenciesContainer
    }

    func flowViewController(coordinatorListener: EditNoteCoordinatorListener, note: Note) -> UIViewController {
        let viewController = EditNoteViewController()
        let presenter = EditNotePresenter(editNote: dependenciesContainer.editNote)
        let coordinator = EditNoteCoordinator()
        presenter.coordinator = coordinator
        presenter.note = note
        coordinator.listener = coordinatorListener
        coordinator.viewController = viewController

        viewController.listener = presenter

        return viewController
    }
}
