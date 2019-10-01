//
//  LoginPresenter.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 30/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

protocol LoginPresenterViewControllable: class {
    func showLoginError()

}

protocol LoginPresenterNavigator {
    func shouldPresentNotes()
    func shouldShowSignUp()
}

class LoginPresenter {
    weak var viewController: LoginPresenterViewControllable?
    var navigator: LoginPresenterNavigator!

    let loginUser: LoginUser

    init(loginUser: LoginUser) {
        self.loginUser = loginUser
    }

}

extension LoginPresenter: LoginViewControllerListener {
    func didTapLogin(with username: String, password: String) {
        loginUser.execute(username: username, password: password) { success in
            if success {
                self.navigator.shouldPresentNotes()
            } else {
                self.viewController?.showLoginError()
            }
        }
    }

    func didTapSignUp() {
        navigator.shouldShowSignUp()
    }


}
