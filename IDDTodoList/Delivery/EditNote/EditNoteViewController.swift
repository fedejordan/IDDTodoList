//
//  EditNoteViewController.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 27/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

protocol EditNoteViewControllerListener {
    func didTapConfirmEdit(with title: String)
}

class EditNoteViewController: UIViewController {

    var listener: EditNoteViewControllerListener!

    @IBOutlet private weak var idLabel: UILabel!
    @IBOutlet private weak var titleTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK:- Actions
    @IBAction private func didTapConfirmEdit(sender: UIButton) {
        let title = titleTextField.text ?? ""
        listener.didTapConfirmEdit(with: title)
    }
}
