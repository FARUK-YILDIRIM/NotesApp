//
//  AddNewNote.swift
//  NotesApp
//
//  Created by Faruk YILDIRIM on 4.01.2022.
//

import SwiftUI

struct AddNewNote: View {
    @StateObject private var addNoteVM: AddNoteViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    init(repo: NoteRepositoryProtocol){
        _addNoteVM = StateObject<AddNoteViewModel>.init(wrappedValue: AddNoteViewModel(repo: repo))
    }
    
    var body: some View {
        NavigationView {
            VStack (spacing: 0) {
                Form {
                    Section {
                        TextField("Note name", text: $addNoteVM.name)
                        
                        DatePicker(selection: $addNoteVM.dueOn, in: Date()..., displayedComponents: .date) {
                            Text("Selected note due date")
                        }.id(addNoteVM.dueOn)
                        
                        ColorPicker("Select note color", selection: $addNoteVM.color)
                        
                        EmojiTextField(text: $addNoteVM.icon, placeholder: "Enter emoji icon")
                    }
                    
                }//.frame(width: 200, height: 200)
                .frame(maxWidth: .infinity, maxHeight: 200)
                
                List {
                    HStack() {
                        TextField("Note item", text: $addNoteVM.note)
                            .onSubmit {
                                addNoteVM.addNoteToList(item: addNoteVM.note)
                            }
                            .submitLabel(.return)
                    }
                    
                    ForEach(addNoteVM.items, id: \.self ){ item in
                        Text(item)
                        
                    }
                }.listStyle(.insetGrouped)
                    .navigationTitle("New Note")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button (action: {
                                presentationMode.wrappedValue.dismiss()
                            }, label: {
                                Image(systemName: "xmark")
                                    .foregroundColor(Color.primary)
                            })
                        }
                        ToolbarItem(placement: .navigationBarTrailing){
                            Button(action: {
                                addNoteVM.add()
                                presentationMode.wrappedValue.dismiss()
                            }, label: {
                                Text("Save")
                                    .foregroundColor(.primary)
                            })
                        }
                    }
            }
        }
    }
    
}

struct AddNewNote_Previews: PreviewProvider {
    static var previews: some View {
        AddNewNote(repo: MockNoteRepository())
.previewInterfaceOrientation(.portraitUpsideDown)
    }
}
