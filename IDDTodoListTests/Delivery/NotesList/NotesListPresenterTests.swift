//
//  NotesListPresenterTests.swift
//  IDDTodoListTests
//
//  Created by Federico Jordan on 25/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import XCTest
@testable import IDDTodoList

class NotesListPresenterTests: XCTestCase {


    private var presenter: NotesListPresenter!
    private let getNotes = MockGetNotes()
    private let deleteNote = MockDeleteNote()

    override func setUp() {
        super.setUp()

        presenter = NotesListPresenter(getNotes: getNotes, deleteNote: deleteNote)
    }

    func testLoadNotesAfterLoad () {
        // Given
        getNotes.executecompletionCallCount = 0

        // When
        presenter.didLoad()

        // Verify
        XCTAssertEqual(1, getNotes.executecompletionCallCount)

    }
}
