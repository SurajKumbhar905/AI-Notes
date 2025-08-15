//
//  NotesListView.swift
//  AI-Notes
//
//  Created by Suraj-KU on 10/08/25.
//

import SwiftUI

// MARK: - Model
struct Note: Identifiable {
    let id = UUID()
    var title: String
    var content: String
}

struct NotesListView: View {
    let columns = [
        GridItem(),
        GridItem()
    ]
    
    @State var serchText : String = ""
    @StateObject private var notesVM:  NotesViewModel
    @Environment(NotesNavigationRouter.self) var notesNavigation
    
    var noteCard : NotesCardDataBase
    
    init(noteCard : NotesCardDataBase) {
        let repo = DataBaseRepository<NotesDatabase>()
        _notesVM = StateObject(wrappedValue:
                                NotesViewModel(DataBaseRepository: repo))
        self.noteCard = noteCard
        
        print(noteCard.title,"noteCrad")
    }
    
    
    var body: some View {
        ZStack(alignment : .bottom){
            Color.primaryBackGround
                .ignoresSafeArea()
            ScrollView(.vertical) {
                LazyHStack(alignment: .top, spacing: 5) {
                    if (noteCard.notes?.count ?? 0 < 1){
                        Text("No Notes")
                            .foregroundColor(.secondary)
                        
                    }else{
                        ForEach(0..<2) { colIndex in
                            LazyVStack(alignment: .leading) {
                                if let notes = noteCard.notes {
                                    if (notes.count < 1){
                                        Text("No Notes")
                                            .foregroundColor(.secondary)
                                    }else{
                                        let filteredNotes = notes.enumerated()
                                            .filter { $0.offset % 2 == colIndex }
                                            .map { $0.element }
                                        ForEach(filteredNotes, id: \.id) { note in
                                            let titleHeight = note.title.heightFor(
                                                width: 185 - 32,
                                                font: UIFont.preferredFont(forTextStyle: .headline)
                                            )
                                            
                                            let contentString = note.notesDescription
                                            let contentHeight = contentString.heightFor(
                                                width: 185 - 32,
                                                font: UIFont.preferredFont(forTextStyle: .subheadline)
                                            )
                                            
                                            let totalHeight = titleHeight + contentHeight + 10 + 32
                                            
                                            NoteCardView(note: note)
                                                .frame(width: 185, height: totalHeight, alignment: .top)
                                                .background(.mint)
                                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                        }
                                        
                                    }
                                }
                            }
                        }
                    }
                }
                .padding()
                .padding(.bottom ,60)
                .navigationTitle(noteCard.title)
                .searchable(text: $serchText , placement : .navigationBarDrawer(displayMode: .always))
                .toolbar(.hidden, for: .tabBar)
                
                
            }
            .frame(maxWidth: .infinity)
            .overlay(alignment:.bottom) {
                Button {
                    notesNavigation.push(.notePlayground(card: noteCard))
                }label: {
                    HStack {
                        Image(systemName: "plus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 20)
                        Text("Add new Note")
                    }
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.secondryBackGround)
                    
                    .clipShape(.rect(cornerRadius: 24, style: .circular))
                }
                .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity)
            
        }
        
    }
    
}


// MARK: - Note Card View
struct NoteCardView: View {
    let note: NotesDatabase
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(note.title)
                .font(.headline)
                .foregroundColor(.white)
                Text(note.notesDescription)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
                
            
            
            
        }
        .frame(maxWidth: .infinity , alignment: .leading)
        .padding(16)
        .background(Color.mint)
        
    }
}

#Preview {
    
    @Previewable @State var noteCard = NotesCardDataBase(title: "Suraj", image: "", date: .now)
    
    NavigationStack{
        NotesListView(noteCard: NotesCardDataBase(title: "d", image: "", date: .now))
            .environment(NotesNavigationRouter())
            
    }
    
}
