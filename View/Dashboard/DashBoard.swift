//
//  DashBoard.swift
//  AI-Notes
//
//  Created by Suraj-KU on 04/08/25.
//

import SwiftUI
import SwiftData

struct DashBoard: View {

    @Environment(NotesNavigationRouter.self) var notesNavigation
    @ObservedObject var viewModel: NotesCardViewModel
    
    let columns = Array(
        repeating: GridItem(.flexible(), spacing: 1),
        count: 2
    )
    var body: some View {
        ZStack(alignment : .top){
            Color.primaryBackGround
                .ignoresSafeArea()
            
            ScrollView{
                VStack{
                    HStack{
                        VStack(alignment:.leading){
                            Text("Welcome back")
                            Text("Notes Taking App")
                        }
                        Spacer()
                        
                        Button {
                            notesNavigation.sheet = .addCard(viewmodel: viewModel)
                        } label: {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 30 , height: 30)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 8)
                        }

                    }
                    .padding(20)
                    
                    SpaceInfoView()
                    
                    LazyVGrid(columns: columns, spacing: 0) {
                        ForEach(viewModel.items) { item in
                            FolderCard(
                                title: item.title,
                                fileCount: "\(item.notes?.count ?? 0)",
                                size: "",
                                iconName: item.image,
                                accentColor: Color.random
                            )
                            .aspectRatio(1, contentMode: .fill)
                            .onTapGesture {
                                notesNavigation.push(.notes(notesCard: item))
                            }
                        }
                    }
                    
                }
                
                .padding(12)
            }
            .onAppear{
                viewModel.loadItems()
            }
 
        }
    }
}



#Preview {
    NavigationStack{
        MainTabView()
            .environment(NotesNavigationRouter())
    }
   
}
