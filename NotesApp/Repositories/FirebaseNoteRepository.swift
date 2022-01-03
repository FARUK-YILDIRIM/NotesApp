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
                
                let goal = try? snapshot.data(as: Note.self)
                completion(.success(goal))
                
            }
            
        }catch let error {
            completion(.failure(error))
        }
    }
    
}
