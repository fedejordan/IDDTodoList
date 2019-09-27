//
//  Note+dummy.swift
//  IDDTodoListTests
//
//  Created by Federico Jordan on 27/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit
@testable import IDDTodoList

extension Note {
    static func dummy() -> Note {
        return Note(id: "1", title: "title")
    }
}
