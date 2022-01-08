//
//  Note.swift
//  NotesApp
//
//  Created by Faruk YILDIRIM on 3.01.2022.
//

import Foundation

struct Note: Codable {
    var id: String?
    var name: String
    var dueOn: Date
    var color: String
    var icon: String
    var items: [String]
}

extension Note {
    static func sampleNotes() -> [Note] {
        return [
            Note(id: UUID().uuidString, name: "Math", dueOn: Date(), color: "F57C00", icon: "🧮", items: [
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry"
            ]),
            
            Note(id: UUID().uuidString, name: "To-Do", dueOn: Date(), color: "FDD835", icon: "📝", items: [
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
            ]),
            
            Note(id: UUID().uuidString, name: "Grocery", dueOn: Date(), color: "0097A7", icon: "🛒", items: [
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
            ]),
            
            Note(id: UUID().uuidString, name: "Stock", dueOn: Date(), color: "689F38", icon: "📉", items: [
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
            ]),
            
            Note(id: UUID().uuidString, name: "Gym", dueOn: Date(), color: "42A5F5", icon: "🏋️", items: [
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
            ]),

        ]
    }
}
