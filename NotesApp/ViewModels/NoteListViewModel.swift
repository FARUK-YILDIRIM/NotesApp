//
//  NoteListViewModel.swift
//  NotesApp
//
//  Created by Faruk YILDIRIM on 4.01.2022.
//

import Foundation

class NoteListViewModel: ObservableObject {
    private var repo: NoteRepositoryProtocol
    
    @Published var notes = [NoteViewModel]()
    
    init(repo: NoteRepositoryProtocol){
        self.repo = repo
    }
    
    func getAllNotes(){
        repo.getAll { result in
            switch result {
            case .success(let fetchedNotes):
                if let fetchedNotes = fetchedNotes {
                    DispatchQueue.main.async {
                        self.notes = fetchedNotes.map(NoteViewModel.init)
                    }
                }
                
            case .failure(let err):
                print(err.localizedDescription)
            }
            
        }
    }
    
    func deleteNote(noteId: String){
        repo.deleteNote(noteId: noteId) { result in
            switch result {
            case .success(let success):
                if success {
                    self.getAllNotes()
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
