//
//  ContentView.swift
//  NotesApp
//
//  Created by Faruk YILDIRIM on 3.01.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear {
                FirebaseNoteRepository().add(note: Note.sampleNotes()[0]) { result in
                    switch result {
                    case .success(let note):
                        print(note?.name ?? "")
                        print(note?.items ?? "")
                    case .failure(let err):
                        print(err.localizedDescription)
                    }
                    
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
