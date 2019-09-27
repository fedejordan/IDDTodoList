//
//  SharedDependenciesContainer.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 26/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

protocol DependenciesContainer {
    var notesService: NotesService { get }
    var addNoteBuilder: AddNoteBuilder { get }
    var editNoteBuilder: EditNoteBuilder { get }
    var getNotes: GetNotes { get }
    var createNote: CreateNote { get }
    var deleteNote: DeleteNote { get }
    var editNote: EditNote { get }
}

class SharedDependenciesContainer: DependenciesContainer {
    // Repositories
    var inMemoryNotesRepository: InMemoryNotesRepository = InMemoryNotesRepository()

    // Services
    var notesService: NotesService {
        return  DefaultNotesService(notesRepository: inMemoryNotesRepository)
    }

    // Actions
    var getNotes: GetNotes {
        return DefaultGetNotes(notesService: notesService)
    }

    var deleteNote: DeleteNote {
        return DefaultDeleteNote(notesService: notesService)
    }

    var createNote: CreateNote {
        return DefaultCreateNote(notesService: notesService)
    }

    var editNote: EditNote {
        return DefaultEditNote(notesService: notesService)
    }

    // Builders
    var notesListBuilder: NotesListBuilder {
        return NotesListBuilder(dependenciesContainer: self)
    }

    var addNoteBuilder: AddNoteBuilder {
        return AddNoteBuilder(dependenciesContainer: self)
    }

    var editNoteBuilder: EditNoteBuilder {
        return EditNoteBuilder(dependenciesContainer: self)
    }
}
