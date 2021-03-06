//
//  AddNoteBuilder.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 25/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

class AddNoteBuilder {

    let dependenciesContainer: DependenciesContainer

    init(dependenciesContainer: DependenciesContainer) {
        self.dependenciesContainer = dependenciesContainer
    }

    func flowViewController(coordinatorListener: AddNoteCoordinatorListener) -> UIViewController {
        let viewController = AddNoteViewController()
        let presenter = AddNotePresenter(createNote: dependenciesContainer.createNote)
        let coordinator = AddNoteCoordinator()
        presenter.coordinator = coordinator
        coordinator.listener = coordinatorListener
        coordinator.viewController = viewController

        viewController.listener = presenter
        
        return viewController
    }

}
