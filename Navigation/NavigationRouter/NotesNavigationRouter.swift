//
//  NavigationRouter.swift
//  AI-Notes
//
//  Created by Suraj-KU on 05/08/25.
//

import Foundation
import SwiftUI

enum Sheet : Identifiable{
    case addCard(viewmodel : NotesCardViewModel)
    var id : String{
        switch self {
        case .addCard:
            return "addCard"
        }
    }
    
}

enum Page : Hashable {
    case notes(notesCard : NotesCardDataBase)
    case notePlayground(card: NotesCardDataBase)
}

@Observable
class NotesNavigationRouter{
    
    var path = NavigationPath()
    
    var sheet : Sheet?
    
    func push(_ page : Page){
        path.append(page)
    }
    
    func openSheet(_ sheet : Sheet){
        self.sheet = sheet
    }
    
    @ViewBuilder
    func buildSheet(sheet : Sheet) -> some View {
        switch sheet {
        case .addCard(let viewModel):
            CreateCard(dashBoardViewmodel: viewModel)
        }
    }
    
    @ViewBuilder
    func buildPage(page : Page) -> some View{
        switch page{
        case .notes(let noteCard):
            NotesListView(noteCard: noteCard)
        case .notePlayground(let card):
            NotePlaygroundView(noteCard: card)
        }
    }
}
