//
//  MockNoteRepository.swift
//  NotesApp
//
//  Created by Faruk YILDIRIM on 3.01.2022.
//

import Foundation

class MockNoteRepository: NoteRepositoryProtocol {
    var notes = Note.sampleNotes()
    
    func getAll(completion: @escaping (Result<[Note]?, Error>) -> Void) {
        completion(.success(notes))
    }
    
    func add(note: Note, completion: @escaping (Result<Note?, Error>) -> Void) {
        var note = note
        note.id = UUID().uuidString
        notes.append(note)
        completion(.success(note))
    }
    
    func deleteNote(noteId: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        notes.removeAll() { n in
            n.id == noteId
        }
        completion(.success(true))
    }
    
    func addNoteItem(noteId: String, item: String, completion: @escaping (Result<Note?, Error>) -> Void) {
        for i in 0..<notes.count {
            if notes[i].id == noteId {
                notes[i].items.append(item)
                completion(.success(notes[i]))
                return
            }
        }
    }
    
    func deleteNoteItem(noteId: String, item: String, completion: @escaping (Result<Note?, Error>) -> Void) {
        for i in 0..<notes.count {
            if notes[i].id == noteId {
                notes[i].items.removeAll { it in
                    it == item
                }
                completion(.success(notes[i]))
                return
            }
        }
    }
    
}
