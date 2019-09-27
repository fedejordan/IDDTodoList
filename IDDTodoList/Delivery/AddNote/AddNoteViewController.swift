//
//  AddNoteViewController.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 25/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

protocol AddNoteViewControllerListener: class {
    func didTapAddNote(with title: String)
}

class AddNoteViewController: UIViewController {

    @IBOutlet private weak var titleTextField: UITextField!

    var listener: AddNoteViewControllerListener!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupInterface()
    }

    // MARK:- Interface
    private func setupInterface() {
        navigationController?.navigationBar.isTranslucent = false
    }

    // MARK:- Actions
    @IBAction private func didTapAddNote() {
        listener.didTapAddNote(with: titleTextField.text ?? "")
    }

}
