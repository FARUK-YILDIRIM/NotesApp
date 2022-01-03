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
            Note(id: UUID().uuidString, name: "Test 1", dueOn: Date(), color: "#ddd", icon: "🙃", items: [
            "Test item 1",
            "Test item 2",
            "Test item 3"
            ]),
            
            Note(id: UUID().uuidString, name: "Test 2", dueOn: Date(), color: "#ddd", icon: "🙂", items: [
            "Test item 1"
            ]),
            
            Note(id: UUID().uuidString, name: "Test 3", dueOn: Date(), color: "#ddd", icon: "🙃", items: [
            "Test item 1",
            "Test item 2",
            ]),
            
            Note(id: UUID().uuidString, name: "Test 4", dueOn: Date(), color: "#ddd", icon: "🙂", items: [
            "Test item 1",
            "Test item 2",
            "Test item 3",
            "Test item 4"
            ])
        
        ]
    }
}
