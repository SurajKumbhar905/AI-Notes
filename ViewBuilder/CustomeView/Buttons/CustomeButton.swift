//
//  CustomeButton.swift
//  AI-Notes
//
//  Created by Suraj-KU on 05/08/25.
//

import SwiftUI

struct NotesButton : ButtonStyle{
    var selected : Bool
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(selected ? .black : .white)
            .foregroundStyle(selected ? .white : .black)
            .clipShape(RoundedRectangle(cornerRadius: 14))
            .overlay(content: {
                RoundedRectangle(cornerRadius: 14)
                    .stroke(Color.black.opacity(0.8), lineWidth: 2)
            })
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
            
        
    }
    
    
}

struct ButtonsView : View {
    var body: some View {
        HStack{
            Button("Press "){
                
            }
            .buttonStyle(NotesButton(selected: true))

        }
    }
}

#Preview {
    ButtonsView()
}
