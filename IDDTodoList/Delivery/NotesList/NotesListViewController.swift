//
//  ViewController.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 24/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

protocol NotesListViewControllerListener {
    var notesCount: Int { get }
    func didLoad()
    func didTapAddNote()
    func didSelectDeleteNote(at index: Int)
    func didSelectEditNote(at index: Int)
    func note(at index: Int) -> NoteViewModel
}

class NotesListViewController: UIViewController {

    @IBOutlet private weak var notesTableView: UITableView!

    var listener: NotesListViewControllerListener!

    override func viewDidLoad() {
        super.viewDidLoad()

        listener.didLoad()
        setupTableView()
    }

    // MARK:- Interface

    private func setupTableView() {
        notesTableView.register(UINib(nibName: "NoteTableViewCell", bundle: nil), forCellReuseIdentifier: "NoteTableViewCell")
    }

    // MARK:- Actions

    @IBAction func didTapAddNote() {
        listener?.didTapAddNote()
    }

}

extension NotesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listener.notesCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NoteTableViewCell", for: indexPath) as? NoteTableViewCell else { return UITableViewCell() }

        let note = listener.note(at: indexPath.row)
        cell.setup(with: note.title )

        return cell
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            listener.didSelectDeleteNote(at: indexPath.row)
        default: print("")
        }
    }
}

extension NotesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        listener.didSelectEditNote(at: indexPath.row)
    }
}

extension NotesListViewController: NotesListPresenterViewControllable {
    func updateNotes() {
        notesTableView.reloadData()
    }

}
