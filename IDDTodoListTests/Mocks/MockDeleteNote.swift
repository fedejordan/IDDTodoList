//
//  MockDeleteNote.swift
//  IDDTodoListTests
//
//  Created by Federico Jordan on 27/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit
@testable import IDDTodoList

class MockDeleteNote: DeleteNote {
    var invokedExecute = false
    var invokedExecuteCount = 0
    var invokedExecuteParameters: (note: Note, Void)?
    var invokedExecuteParametersList = [(note: Note, Void)]()
    var stubbedExecuteCompletionResult: (Bool, Void)?
    func execute(note: Note, completion: (Bool) -> Void) {
        invokedExecute = true
        invokedExecuteCount += 1
        invokedExecuteParameters = (note, ())
        invokedExecuteParametersList.append((note, ()))
        if let result = stubbedExecuteCompletionResult {
            completion(result.0)
        }
    }
}
