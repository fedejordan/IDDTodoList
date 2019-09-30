//
//  LoginViewController.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 30/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

protocol LoginViewControllerListener {
    func didTapLogin(with username: String, password: String)
}

class LoginViewController: UIViewController {

    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!

    var listener: LoginViewControllerListener!

    // MARK:- Actions
    @IBAction private func didTapLogin(sender: UIButton) {
        guard let username = usernameTextField.text,
            let password = passwordTextField.text else {
                return
        }
        listener.didTapLogin(with: username, password: password)
    }

}

extension LoginViewController: LoginPresenterViewControllable {
    
    func showLoginError() {
        let alertController = UIAlertController(title: "Error", message: "User and/or password are incorrect", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }

}
