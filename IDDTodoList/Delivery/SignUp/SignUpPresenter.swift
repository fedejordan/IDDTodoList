//
//  SignUpPresenter.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 01/10/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

protocol SignUpPresenterViewControllable: class {
    func showSignUpError()
}

protocol SignUpPresenterNavigator {
    func shouldPresentNotes()
}

class SignUpPresenter {

    weak var viewController: SignUpPresenterViewControllable?
    var navigator: SignUpPresenterNavigator!
    let signUpUser: SignUpUser

    init(signUpUser: SignUpUser) {
        self.signUpUser = signUpUser
    }
}

extension SignUpPresenter: SignUpViewControllerListener {

    func didTapSignUp(with username: String, password: String, confirmPassword: String) {
        signUpUser.execute(with: username, password: password, confirmPassword: confirmPassword) { success in
            if success {
                self.navigator.shouldPresentNotes()
            } else {
                self.viewController?.showSignUpError()
            }

        }
    }
    
}
