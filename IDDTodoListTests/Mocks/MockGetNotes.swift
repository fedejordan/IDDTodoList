//
//  MockGetNotes.swift
//  IDDTodoListTests
//
//  Created by Federico Jordan on 25/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import XCTest
@testable import IDDTodoList

class MockGetNotes: GetNotes {

    var executecompletionHandler: ((([Note]) -> Void) -> Void)? = nil
    var executecompletionCallCount: Int = 0

    func execute(completion: (([Note]) -> Void)) {
        executecompletionCallCount += 1
        executecompletionHandler?(completion)
    }


}
