//
//  NoteView.swift
//  NotesApp
//
//  Created by Faruk YILDIRIM on 4.01.2022.
//

import SwiftUI

struct NoteView: View {
    
    let noteViewModel: NoteViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(noteViewModel.name)
                .font(.largeTitle)
                .multilineTextAlignment(.leading)
            
            Text(noteViewModel.dueOn.lowercased())
            
            HStack(alignment: .bottom) {
                Text("\(noteViewModel.items.count) items")
                    .padding(.top, 20)
                Spacer()
                Text(noteViewModel.icon)
                    .font(.largeTitle)
            }
        }.foregroundColor(.white)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(noteViewModel.color))
    }
    
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView(noteViewModel: NoteViewModel(note: Note.sampleNotes()[3]))
    }
}

