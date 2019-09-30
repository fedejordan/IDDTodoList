//
//  LoginBuilder.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 30/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

class LoginBuilder{

    let dependenciesContainer: DependenciesContainer

    init(dependenciesContainer: DependenciesContainer) {
        self.dependenciesContainer = dependenciesContainer
    }

    func flowViewController(navigatorListener: LoginNavigatorListener) -> UIViewController {
        let viewController = LoginViewController()
        let presenter = LoginPresenter(loginUser: dependenciesContainer.loginUser)

        viewController.listener = presenter
        presenter.viewController = viewController
        let navigator = LoginNavigator()
        presenter.navigator = navigator
        navigator.viewController = viewController
        navigator.listener = navigatorListener

        return viewController
    }

}
