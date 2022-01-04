//
//  AddNoteViewModel.swift
//  NotesApp
//
//  Created by Faruk YILDIRIM on 4.01.2022.
//

import Foundation
import SwiftUI

class AddNoteViewModel: ObservableObject {
    private let repo: NoteRepositoryProtocol
    
    var name: String = ""
    var dueOn = Date()
    var color: Color = .yellow
    var icon: String = "👻"
    var note: String = ""
    
    @Published var saved: Bool = false
    @Published var items: [String] = []
    
    init(repo: NoteRepositoryProtocol){
        self.repo = repo
    }
    
    
    func addNoteToList(item: String) {
        guard !item.isEmpty, item.count >= 3 else {return}
        items.append(item)
        note = ""
    }
    
    func add(){
        let note = Note(name: name, dueOn: dueOn, color: UIColor(color).hexStringFromColor(), icon: icon, items: items)
        
        repo.add(note: note){ result in
            switch result {
            case .success(let saveNote):
                DispatchQueue.main.async {
                    self.saved = saveNote == nil ? false : true
                }
                
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
