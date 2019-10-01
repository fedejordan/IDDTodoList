//
//  SignUpViewController.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 01/10/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

protocol SignUpViewControllerListener {
    func didTapSignUp(with username: String, password: String, confirmPassword: String)
}

class SignUpViewController: UIViewController {

    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var confirmPasswordTextField: UITextField!

    var listener: SignUpViewControllerListener!

    // MARK:- Actions
    @IBAction private func didTapSignUp(sender: UIButton) {
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let confirmPassword = confirmPasswordTextField.text ?? ""
        listener.didTapSignUp(with: username, password: password, confirmPassword: confirmPassword)
    }
}

extension SignUpViewController: SignUpPresenterViewControllable {

    func showSignUpError() {
        let alertController = UIAlertController(title: "Error", message: "Passwords don't mismatch", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
