//
//  AddNoteCoordinator.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 26/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

protocol AddNoteCoordinatorListener: class {
    func didAddNote()
}

class AddNoteCoordinator: NSObject {

    weak var viewController: UIViewController?
    weak var listener: AddNoteCoordinatorListener?

}

extension AddNoteCoordinator: AddNotePresenterCoordinator {

    func goBack() {
        DispatchQueue.main.async {
            self.viewController?.navigationController?.popViewController(animated: true)
            self.listener?.didAddNote()
        }
    }

}
