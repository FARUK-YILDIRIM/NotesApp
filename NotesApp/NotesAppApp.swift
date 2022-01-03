//
//  NotesAppApp.swift
//  NotesApp
//
//  Created by Faruk YILDIRIM on 3.01.2022.
//

import SwiftUI
import Firebase

@main
struct NotesAppApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
