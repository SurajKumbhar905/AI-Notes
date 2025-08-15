//
//  AI_NotesApp.swift
//  AI-Notes
//
//  Created by Suraj-KU on 04/08/25.
//

import SwiftUI
import SwiftData

@main
struct AI_NotesApp: App {
    @State var navigaion = NotesNavigationRouter()
    var modelContainer = try! ModelContainer(for: NotesCardDataBase.self, NotesDatabase.self)
    var body: some Scene {
        WindowGroup {
                MainTabView()
        }
        .modelContainer(for: [NotesCardDataBase.self , NotesDatabase.self])
        .environment(navigaion)
        
    }
}
