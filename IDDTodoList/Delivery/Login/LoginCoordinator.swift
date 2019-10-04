//
//  LoginCoordinator.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 30/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

protocol LoginCoordinatorListener: class {
    func userDidLogin()
}

class LoginCoordinator: NSObject {

    weak var viewController: UIViewController?
    weak var listener: LoginCoordinatorListener?
    let signUpBuilder: SignUpBuilder

    init(signUpBuilder: SignUpBuilder) {
        self.signUpBuilder = signUpBuilder
    }
}

extension LoginCoordinator: LoginPresenterCoordinator {

    func shouldPresentNotes() {
        DispatchQueue.main.async {
            self.listener?.userDidLogin()
        }
    }

    func shouldShowSignUp() {
        let signUpViewController = signUpBuilder.flowViewController(coordinatorListener: self)
        viewController?.show(signUpViewController, sender: nil)
    }

}

extension LoginCoordinator: SignUpCoordinatorListener {

    func userDidSignUp() {
        shouldPresentNotes()
    }

}
