//
//  NotePlaygroundView.swift
//  AI-Notes
//
//  Created by Suraj-KU on 10/08/25.
//

import SwiftUI

struct NotePlaygroundView: View {
    @State var title : String = ""
    @State private var noteText: AttributedString = AttributedString()
    
    @FocusState private var isFocused: Bool
    
    var noteCard : NotesCardDataBase
    
    @StateObject private var notesVM:  NotesViewModel
    
    init(noteCard: NotesCardDataBase) {
        self.noteCard = noteCard
        
        let repo = DataBaseRepository<NotesDatabase>()
        _notesVM = StateObject(wrappedValue:
                                    NotesViewModel(DataBaseRepository: repo))

    }
    
    var body: some View {
        VStack{
            TextField(text: $title) {
                Text("Page Title")
                    .font(.system(size: 26 , weight: .bold))
            }
            ZStack(alignment : .top){
                TextEditor(text: $noteText)
                    .focused($isFocused)
                    .lineSpacing(8)
                    .textEditorStyle(.plain)
                if !isFocused && noteText.characters.isEmpty {
                        Text("Enter note")
                        .padding(.vertical)
                        .foregroundStyle(.gray)
                        .font(.system(size: 20 , weight: .medium))
                        .frame(maxWidth: .infinity , maxHeight: .infinity ,  alignment: .topLeading)
                        .animation(.easeInOut, value: isFocused)
                       
                }
            }
          
          
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        
                        let newNote = NotesDatabase(notes: noteCard, title: title, notesDescription: String( noteText.characters))
                            
                            noteCard.notes?.append(newNote)
                            
                            if noteCard.notes == nil {
                                noteCard.notes = [newNote]
                            }
                            
                            notesVM.addItem(newNote)

                      
                        
                    }) {
                        Text("Save")
                            .padding(8)
                    }
                }
            
        }

    }
}

#Preview {
    NavigationStack{
        NotePlaygroundView(noteCard: NotesCardDataBase(title: "", image: "", date: .now))
    }
  
}


extension AttributedString {
    static func get(from data: Data?) -> NSAttributedString? {
        guard let data else { return nil }
        var attributedString: NSAttributedString?
        do {
            attributedString = try NSKeyedUnarchiver.unarchivedObject(ofClass: NSAttributedString.self, from: data)
        } catch {
            print("Error converting Data to NSAttributedString: \(error)")
        }
        return attributedString
    }
    
    var data: Data? {
        var data: Data?
        do {
            data = try NSKeyedArchiver.archivedData(withRootObject: self,
                                                    requiringSecureCoding: false)
        } catch {
            print("Error converting NSAttributedString to Data: \(error)")
        }
        return data
    }
}
