//
//  NoteRepositoryProtocol.swift
//  NotesApp
//
//  Created by Faruk YILDIRIM on 3.01.2022.
//

import Foundation

protocol NoteRepositoryProtocol {
    func getAll(completion: @escaping (Result<[Note]?, Error>) -> Void)
    func add(note: Note, completion: @escaping (Result<Note?, Error>) -> Void)
    func deleteNote(noteId: String, completion: @escaping (Result<Bool, Error>) -> Void)
    func addNoteItem (noteId: String, item: String, completion: @escaping (Result<Note?, Error>) -> Void)
    func deleteNoteItem (noteId: String, item: String, completion: @escaping (Result<Note?, Error>) -> Void)
}
