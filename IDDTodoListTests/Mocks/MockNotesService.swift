//
//  MockNotesService.swift
//  IDDTodoListTests
//
//  Created by Federico Jordan on 25/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit
@testable import IDDTodoList

class MockNotesService: NotesService {
    var invokedGetAllNotes = false
    var invokedGetAllNotesCount = 0
    var stubbedGetAllNotesCompletionResult: ([Note], Void)?
    func getAllNotes(completion: ([Note]) -> Void) {
        invokedGetAllNotes = true
        invokedGetAllNotesCount += 1
        if let result = stubbedGetAllNotesCompletionResult {
            completion(result.0)
        }
    }
    var invokedCreateNote = false
    var invokedCreateNoteCount = 0
    var invokedCreateNoteParameters: (title: String, Void)?
    var invokedCreateNoteParametersList = [(title: String, Void)]()
    var stubbedCreateNoteCompletionResult: (Bool, Void)?
    func createNote(with title: String, completion: (Bool) -> Void) {
        invokedCreateNote = true
        invokedCreateNoteCount += 1
        invokedCreateNoteParameters = (title, ())
        invokedCreateNoteParametersList.append((title, ()))
        if let result = stubbedCreateNoteCompletionResult {
            completion(result.0)
        }
    }
    var invokedDelete = false
    var invokedDeleteCount = 0
    var invokedDeleteParameters: (note: Note, Void)?
    var invokedDeleteParametersList = [(note: Note, Void)]()
    var stubbedDeleteCompletionResult: (Bool, Void)?
    func delete(note: Note, completion: (Bool) -> Void) {
        invokedDelete = true
        invokedDeleteCount += 1
        invokedDeleteParameters = (note, ())
        invokedDeleteParametersList.append((note, ()))
        if let result = stubbedDeleteCompletionResult {
            completion(result.0)
        }
    }
    var invokedEdit = false
    var invokedEditCount = 0
    var invokedEditParameters: (note: Note, title: String)?
    var invokedEditParametersList = [(note: Note, title: String)]()
    var stubbedEditCompletionResult: (Note?, Void)?
    func edit(note: Note, with title: String, completion: @escaping (Note?) -> Void) {
        invokedEdit = true
        invokedEditCount += 1
        invokedEditParameters = (note, title)
        invokedEditParametersList.append((note, title))
        if let result = stubbedEditCompletionResult {
            completion(result.0)
        }
    }
}
