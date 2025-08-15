//
//  TabView.swift
//  AI-Notes
//
//  Created by Suraj-KU on 04/08/25.
//

import SwiftUI


struct MainTabView: View {
    @State var selectedTabs : Tabs = .notes
    @State var searchString : String = ""
    @Environment(NotesNavigationRouter.self) var notesNavigation
    @Environment(\.modelContext) private var modelContext
    @StateObject private var dashBoardVM:  NotesCardViewModel
    
    init() {
        let repo = DataBaseRepository<NotesCardDataBase>()
        _dashBoardVM = StateObject(wrappedValue:
                                    NotesCardViewModel(DataBaseRepository: repo))
      }
    
    var body: some View {
        @Bindable var notesNavigation = notesNavigation
        TabView(selection: $selectedTabs) {
            Tab("Notes" , systemImage: "document.on.clipboard" , value: .notes ){
                NavigationStack(path: $notesNavigation.path){
                    DashBoard(viewModel: dashBoardVM)
                        .navigationDestination(for: Page.self, destination: { page in
                            notesNavigation.buildPage(page: page)
                        })
                        .sheet(item: $notesNavigation.sheet, content: { sheet in
                            notesNavigation.buildSheet(sheet: sheet)
                                .presentationDetents([.medium])
                        })
                        .environment(notesNavigation)
                }
              
            }
            Tab("Event" , systemImage: "calendar.badge.plus" , value: .event ){
               Text("Suraj")
            }
            
            Tab(value: .search, role: .search) {
                NavigationStack{
                    RoundedRectangle(cornerRadius: 12)
                }
                .searchable(text: $searchString)
              
            }
        }
        .tabBarMinimizeBehavior(.onScrollDown)
        .tint(Color.black)
        .glassEffectTransition(.matchedGeometry, isEnabled: true)
        
    }
}

#Preview {
    MainTabView()
}
