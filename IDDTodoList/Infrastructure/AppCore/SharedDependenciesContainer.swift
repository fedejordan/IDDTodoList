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
    var loginBuilder: LoginBuilder { get }
    var signUpBuilder: SignUpBuilder { get }
    var getNotes: GetNotes { get }
    var createNote: CreateNote { get }
    var deleteNote: DeleteNote { get }
    var editNote: EditNote { get }
    var loginUser: LoginUser { get }
    var signUpUser: SignUpUser { get }
    var logoutUser: LogoutUser { get }
}

class SharedDependenciesContainer: DependenciesContainer {
    // Repositories
    var notesRepository: NotesRepository = UserDefaultsNotesRepository()
    var sessionsRepository: SessionsRepository = InMemorySessionsRepository()
    var usersRepository: UsersRepository = InMemoryUsersRepository()

    // Services
    var notesService: NotesService {
        return DefaultNotesService(notesRepository: notesRepository,
                                   authenticationService: authenticationService)
    }

    var authenticationService: AuthenticationService {
        return DefaultAuthenticationService(usersService: usersService,
                                            sessionsRepository: sessionsRepository)
    }

    var usersService: UsersService {
        return DefaultUsersService(usersRepository: usersRepository)
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

    var loginUser: LoginUser {
        return DefaultLoginUser(authenticationService: authenticationService)
    }

    var signUpUser: SignUpUser {
        return DefaultSignUpUser(authenticationService: authenticationService)
    }

    var logoutUser: LogoutUser {
        return DefaultLogoutUser(authenticationService: authenticationService)
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

    var loginBuilder: LoginBuilder {
        return LoginBuilder(dependenciesContainer: self)
    }

    var signUpBuilder: SignUpBuilder {
        return SignUpBuilder(dependenciesContainer: self)
    }
}
