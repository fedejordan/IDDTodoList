//
//  NotesRepository.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 25/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

protocol NotesRepository {
    func getNotes(for userId: String, completion: ([Note]) -> Void)
    func add(note: Note, completion: (Bool) -> Void)
    func delete(note: Note, completion: (Bool) -> Void)
    func update(note: Note, with title: String, completion: (Bool) -> Void)
    func getNote(with id: String, completion: (Note?) -> Void)
}

