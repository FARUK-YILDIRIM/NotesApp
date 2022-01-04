//
//  NoteDetailView.swift
//  NotesApp
//
//  Created by Faruk YILDIRIM on 4.01.2022.
//

import SwiftUI

struct NoteDetailView: View {
    @ObservedObject var viewModel: NoteDetailViewModel
    
    init(noteDetailViewModel: NoteDetailViewModel) {
        self.viewModel = noteDetailViewModel
    }
    
    var body: some View {
        VStack(spacing: 0){
            VStack(alignment: .leading){
                HStack(){
                    Text(viewModel.note.name)
                        .font(.title)
                        .bold()
                    
                    Spacer()
                    Text(viewModel.note.icon)
                }
                
                Text("Due: \(viewModel.note.dueOn)")
                    .padding(.vertical)
                
            }
            .padding(.horizontal)
            .foregroundColor(.white)
            .background(LinearGradient(colors: [viewModel.note.color, viewModel.note.color.opacity(0.6)], startPoint: .top, endPoint: .bottom))
            
            List {
                HStack {
                    TextField("Enter note", text: $viewModel.item)
                        .onSubmit {
                            viewModel.add(item: viewModel.item)
                        }
                        .submitLabel(.return)
                }
                
                ForEach(viewModel.note.items, id: \.self) { item in
                    Text(item)
                }.onDelete { indexSet in
                    for i in indexSet {
                        viewModel.delete(item: viewModel.note.items[i])
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct NoteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NoteDetailView(noteDetailViewModel: NoteDetailViewModel(repo: MockNoteRepository(), note: NoteViewModel(note: Note.sampleNotes()[2])))
    }
}
