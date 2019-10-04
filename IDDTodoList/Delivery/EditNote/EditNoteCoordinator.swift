//
//  EditNoteCoordinator.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 27/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

protocol EditNoteCoordinatorListener: class {
    func didUpdateNote()
}

class EditNoteCoordinator {

    weak var viewController: UIViewController?
    weak var listener: EditNoteCoordinatorListener?

}

extension EditNoteCoordinator: EditNotePresenterCoordinator {

    func goBack() {
        DispatchQueue.main.async {
            self.viewController?.navigationController?.popViewController(animated: true)
            self.listener?.didUpdateNote()
        }
    }
}
