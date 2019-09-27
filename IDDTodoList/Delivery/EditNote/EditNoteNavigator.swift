//
//  EditNoteNavigator.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 27/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

protocol EditNoteNavigatorListener: class {
    func didUpdateNote()
}

class EditNoteNavigator {

    weak var viewController: UIViewController?
    weak var listener: EditNoteNavigatorListener?

}

extension EditNoteNavigator: EditNotePresenterNavigator {

    func goBack() {
        DispatchQueue.main.async {
            self.viewController?.navigationController?.popViewController(animated: true)
            self.listener?.didUpdateNote()
        }
    }
}
