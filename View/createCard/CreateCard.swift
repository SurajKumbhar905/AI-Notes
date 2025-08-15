//
//  CreateCard.swift
//  AI-Notes
//
//  Created by Suraj-KU on 05/08/25.
//

import SwiftUI


struct CreateCard: View {
    @State var titleText : String = ""
    @State var selectedTheme : CardImage = .document
    @ObservedObject var dashBoardViewmodel : NotesCardViewModel
    @Environment(NotesNavigationRouter.self) var notesNavigation
    
    var body: some View {
        VStack{
            HStack{
                TextField(text: $titleText) {
                    Text("Suraj")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                }
                .padding()
                .background(Color.primaryBackGround)
                .clipShape(
                    RoundedRectangle(cornerRadius: 24)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 2)
                )
                
                Picker("", selection: $selectedTheme) {
                    ForEach(CardImage.allCases) { theme in
                        Image(systemName: theme.rawValue)
                            .tag(theme)
                    }
                }
                .pickerStyle(.automatic)
                .tint(.black)
                .frame(maxWidth: 70)
            }
            
            HStack{
                Button("Cancel"){
                    notesNavigation.sheet = nil
                }
                .buttonStyle(NotesButton(selected: false))
                Spacer()
                    .frame(maxWidth: 10)
                    
                Button("Save"){
                    let data  : NotesCardDataBase = NotesCardDataBase(title: titleText, image: selectedTheme.rawValue , date: .now)
                    dashBoardViewmodel.addItem( data)
                    notesNavigation.sheet = nil
                }
                .buttonStyle(NotesButton(selected: true))

            }
            .padding()
            
        }
        .padding()

        
    }
}


