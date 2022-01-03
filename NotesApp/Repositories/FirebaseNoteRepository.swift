//
//  FirebaseNoteRepository.swift
//  NotesApp
//
//  Created by Faruk YILDIRIM on 3.01.2022.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class FirebaseNoteRepository {
    private let db = Firestore.firestore()
    
    func add(note: Note, completion: @escaping (Result<Note?, Error>) -> Void){
        do {
            
            let ref = try db.collection("notes").addDocument(from: note)
            ref.getDocument { snapshot, error in
                guard let snapshot = snapshot, error == nil else{
                    completion(.failure(error ?? NSError(domain: "snapshot is nil", code: 101, userInfo: nil)))
                    return
                }
                
                let note = try? snapshot.data(as: Note.self)
                completion(.success(note))
                
            }
            
        }catch let error {
            completion(.failure(error))
        }
    }
    
}

extension FirebaseNoteRepository: NoteRepositoryProtocol {
    
    func getAll(completion: @escaping (Result<[Note]?, Error>) -> Void) {
        db.collection("notes").getDocuments { snapshot, error in
            guard let snapshot = snapshot, error == nil else {
                completion(.failure(error ?? NSError(domain: "snapshot is nill", code: 102, userInfo: nil)))
                return
            }
            
            let notes: [Note]? = snapshot.documents.compactMap { doc in
                var note = try? doc.data(as: Note.self)
                if note != nil {
                    note!.id = doc.documentID
                }
                return note
            }
            completion(.success(notes))
        }
    }
    
    func deleteNote(noteId: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        db.collection("notes").document(noteId).delete { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(true))
            }
        }
    }
    
    func addNoteItem(noteId: String, item: String, completion: @escaping (Result<Note?, Error>) -> Void) {
        let ref = db.collection("notes").document(noteId)
        ref.updateData(["items" : FieldValue.arrayUnion([item])]) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                ref.getDocument { snapshot, error in
                    guard let snapshot = snapshot, error == nil else {
                        completion(.failure(error ?? NSError(domain: "snapshot for item update is nill", code: 103, userInfo: nil)))
                        return
                    }
                    var note: Note? = try? snapshot.data(as: Note.self)
                    if note != nil {
                        note!.id = snapshot.documentID
                        completion(.success(note))
                    }
                }
            }
        }
    }
    
    func deleteNoteItem(noteId: String, item: String, completion: @escaping (Result<Note?, Error>) -> Void) {
        let ref = db.collection("notes").document(noteId)
        ref.updateData(["items" : FieldValue.arrayRemove([item])]) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                ref.getDocument { snapshot, error in
                    guard let snapshot = snapshot, error == nil else {
                        completion(.failure(error ?? NSError(domain: "snapshot for item delete is nill", code: 103, userInfo: nil)))
                        return
                    }
                    var note: Note? = try? snapshot.data(as: Note.self)
                    if note != nil {
                        note!.id = snapshot.documentID
                        completion(.success(note))
                    }
                }
            }
        }
    }
    
}
