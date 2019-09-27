//
//  NoteTableViewCell.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 25/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!

    func setup(with title: String) {
        titleLabel.text = title
    }
    
}
