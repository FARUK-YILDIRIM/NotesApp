//
//  NoteDetailViewModel.swift
//  NotesApp
//
//  Created by Faruk YILDIRIM on 4.01.2022.
//

import Foundation
import UIKit
import SwiftUI

class NoteDetailViewModel: ObservableObject {
    private var repo: NoteRepositoryProtocol
    
    @Published var note: NoteViewModel
    
    var item = ""
    
    init(repo: NoteRepositoryProtocol, note: NoteViewModel){
        self.repo = repo
        self.note = note
    }
    
    func add(item: String) {
        repo.addNoteItem(noteId: note.id, item: item){ result in
            switch result {
            case .success(let newNote):
                if let newNote = newNote {
                    DispatchQueue.main.async {
                        self.note = NoteViewModel(note: newNote)
                        self.item = ""
                    }
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func delete(item: String){
        repo.deleteNoteItem(noteId: note.id, item: item){ result in
            switch result {
            case .success(let newNote):
                if let newNote = newNote{
                    DispatchQueue.main.async {
                        self.note = NoteViewModel(note: newNote)
                    }
                }
            case.failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
