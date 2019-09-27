//
//  NoteDTO.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 26/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

struct NoteDTO {
    let id: String
    let title: String

    func toNote() -> Note {
        return Note(id: id, title: title)
    }

}
