//
//  SignUpNavigator.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 01/10/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

protocol SignUpNavigatorListener: class {
    func userDidSignUp()
}

class SignUpNavigator {
    weak var listener: SignUpNavigatorListener?
    weak var viewController: UIViewController?
}

extension SignUpNavigator: SignUpPresenterNavigator {

    func shouldPresentNotes() {
        listener?.userDidSignUp()
    }
}
