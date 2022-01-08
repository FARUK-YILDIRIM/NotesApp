//
//  ContentView.swift
//  NotesApp
//
//  Created by Faruk YILDIRIM on 3.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    private var repo: NoteRepositoryProtocol
    
    @ObservedObject var noteListViewModel: NoteListViewModel
    
    @State private var isEditing = false
    @State private var showAddNewNote = false
    
    init(repo: NoteRepositoryProtocol){
        self.repo = repo
        
        noteListViewModel = NoteListViewModel(repo: repo)
        Theme.navigationBarColors(background: .clear, titleColor: .black, tintColor: .white)
    }
    
    private var noteItems: [GridItem] {
        Array(repeating: .init(.adaptive(minimum: 120)), count: 2)
    }
    
    private func deleteButton(note: NoteViewModel) -> some View {
        Button {
            noteListViewModel.deleteNote(noteId: note.id)
        } label: {
            Image(systemName: "minus.circle.fill")
        }
        .font(.title)
        .foregroundColor(isEditing ? .red : .clear)
        .offset(x: -90, y: -70)
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing){
                ScrollView(.vertical, showsIndicators: false){
                    LazyVGrid(columns: noteItems, spacing: 10){
                        ForEach(noteListViewModel.notes, id: \.id) { note in
                        NavigationLink(destination:
                          NoteDetailView(noteDetailViewModel: NoteDetailViewModel(repo: repo, note: note))) {
                                NoteView(noteViewModel: note)
                                    .rotationEffect(.degrees(isEditing ? 2.5 : 0))
                                    .animation(Animation.easeInOut(duration: 0.12).repeat(while: isEditing), value: isEditing)
                                    .disabled(isEditing)
                                    .overlay(deleteButton(note: note))
                                  
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                }
                .onAppear {
                    noteListViewModel.getAllNotes()
                }
                .navigationTitle("Notes")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action:{
                            isEditing.toggle()
                        }){
                            Text(isEditing ? "Done" : "Edit")
                                .foregroundColor(.primary)
                        }
                    }
                }
                
                Button(action: {
                    showAddNewNote = true
                }) {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 64))
                        .shadow(radius: 5)
                        .clipped()
                        .foregroundColor(.blue)
                    
                }
                .padding(.trailing, 20)
                .opacity(isEditing ? 0.0 : 1.0)
                
                .fullScreenCover(isPresented: $showAddNewNote) {
                    noteListViewModel.getAllNotes()
                } content: {
                    AddNewNote(repo: repo)
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(repo: MockNoteRepository())
    }
}
