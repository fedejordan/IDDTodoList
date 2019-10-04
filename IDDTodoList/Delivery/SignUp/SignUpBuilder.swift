//
//  SignUpBuilder.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 01/10/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

class SignUpBuilder: NSObject {
    let dependenciesContainer: DependenciesContainer

    init(dependenciesContainer: DependenciesContainer) {
        self.dependenciesContainer = dependenciesContainer
    }

    func flowViewController(coordinatorListener: SignUpCoordinatorListener) -> UIViewController {
        let viewController = SignUpViewController()
        let presenter = SignUpPresenter(signUpUser: dependenciesContainer.signUpUser)

        viewController.listener = presenter
        presenter.viewController = viewController
        let coordinator = SignUpCoordinator()
        presenter.coordinator = coordinator
        coordinator.viewController = viewController
        coordinator.listener = coordinatorListener

        return viewController
    }
}
