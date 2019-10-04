//
//  SignUpCoordinator.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 01/10/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

protocol SignUpCoordinatorListener: class {
    func userDidSignUp()
}

class SignUpCoordinator {
    weak var listener: SignUpCoordinatorListener?
    weak var viewController: UIViewController?
}

extension SignUpCoordinator: SignUpPresenterCoordinator {

    func shouldPresentNotes() {
        listener?.userDidSignUp()
    }
}
