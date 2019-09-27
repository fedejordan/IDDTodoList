//
//  EditNote.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 27/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

protocol EditNote {
    func execute(for note: Note, with title: String, completion: @escaping (Note?) -> Void)
}

class DefaultEditNote: EditNote {

    let notesService: NotesService

    init(notesService: NotesService) {
        self.notesService = notesService
    }

    func execute(for note: Note, with title: String, completion: @escaping (Note?) -> Void) {
        notesService.edit(note: note, with: title, completion: completion)
    }

}
