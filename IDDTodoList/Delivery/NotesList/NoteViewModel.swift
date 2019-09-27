//
//  NoteViewModel.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 25/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

class NoteViewModel {

    private let note: Note

    var title: String {
        return note.title
    }

    init(note: Note) {
        self.note = note
    }
}
