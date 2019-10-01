//
//  LoginNavigator.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 30/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

protocol LoginNavigatorListener: class {
    func userDidLogin()
}

class LoginNavigator: NSObject {

    weak var viewController: UIViewController?
    weak var listener: LoginNavigatorListener?
    let signUpBuilder: SignUpBuilder

    init(signUpBuilder: SignUpBuilder) {
        self.signUpBuilder = signUpBuilder
    }
}

extension LoginNavigator: LoginPresenterNavigator {

    func shouldPresentNotes() {
        DispatchQueue.main.async {
            self.listener?.userDidLogin()
        }
    }

    func shouldShowSignUp() {
        let signUpViewController = signUpBuilder.flowViewController(navigatorListener: self)
        viewController?.show(signUpViewController, sender: nil)
    }

}

extension LoginNavigator: SignUpNavigatorListener {

    func userDidSignUp() {
        shouldPresentNotes()
    }

}
