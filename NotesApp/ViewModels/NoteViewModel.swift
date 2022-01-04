//
//  NoteViewModel.swift
//  NotesApp
//
//  Created by Faruk YILDIRIM on 4.01.2022.
//

import Foundation
import UIKit
import SwiftUI

struct NoteViewModel {
    
    var note: Note
    
    var id: String {
        note.id ?? ""
    }
    
    var name: String {
        note.name
    }
    
    var dueOnDate: Date {
        note.dueOn
    }
    
    var dueOn: String {
        note.dueOn.toReleativeDate()
    }
    
    var color: Color {
        Color(UIColor(hexString: note.color))
    }
    
    var icon: String {
        note.icon
    }
    
    var items: [String] {
        get {
            return note.items
        }
        
        set(newItems) {
            note.items = newItems
        }
    }
}
