//
//  CreateNote.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 25/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

protocol CreateNote {
    func execute(with title: String, completion: (Bool) -> Void)
}

class DefaultCreateNote: CreateNote {

    let notesService: NotesService

    init(notesService: NotesService) {
        self.notesService = notesService
    }

    func execute(with title: String, completion: (Bool) -> Void) {
        notesService.createNote(with: title, completion: completion)
    }


}
