//
//  GetNotes.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 25/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

protocol GetNotes {
    func execute(completion: (([Note]) -> Void))
}

class DefaultGetNotes: GetNotes {

    let notesService: NotesService

    init(notesService: NotesService) {
        self.notesService = notesService
    }

    func execute(completion: (([Note]) -> Void)) {
        notesService.getAllNotes(completion: completion)
    }
}
