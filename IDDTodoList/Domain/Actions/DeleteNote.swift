//
//  DeleteNote.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 26/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

protocol DeleteNote {
    func execute(note: Note, completion: (Bool) -> Void)

}

class DefaultDeleteNote: DeleteNote {

    let notesService: NotesService

    init(notesService: NotesService) {
        self.notesService = notesService
    }

    func execute(note: Note, completion: (Bool) -> Void) {
        notesService.delete(note: note, completion: completion)
    }
    
}
