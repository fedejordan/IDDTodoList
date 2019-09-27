//
//  DefaultGetNotesTests.swift
//  IDDTodoListTests
//
//  Created by Federico Jordan on 25/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import XCTest
@testable import IDDTodoList

class DefaultGetNotesTests: XCTestCase {

    var getNotes: GetNotes!
    let notesService = MockNotesService()

    override func setUp() {
        super.setUp()

        getNotes = DefaultGetNotes(notesService: notesService)
    }

    func testGetSomeNotes() {
        // Given
        notesService.stubbedGetAllNotesCompletionResult = (Array(0...4).map { _ in Note.dummy() }, ())

        // When
        var notes: [Note] = []
        getNotes.execute { notesAction in
            notes = notesAction
        }

        // Verify
        XCTAssertEqual(5, notes.count)

    }

}
