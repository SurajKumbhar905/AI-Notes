//
//  DummyData.swift
//  AI-Notes
//
//  Created by Suraj-KU on 04/08/25.
//

import Foundation
import SwiftUI


struct NotesCard : Identifiable {
    let id : String = UUID().uuidString
    let title: String
    let fileCount: String
    let size: String
    let iconName: String
    let accentColor: Color
}

struct DummyData{
    static let data : [NotesCard]  = [
        .init(  title: "Personal",
                fileCount: "30 Files",
                size: "Size: 56 MB",
                iconName: "doc.on.doc",
                accentColor: .purple),
        .init(  title: "Acadamic",
                fileCount: "102 Files",
                size: "Size: 56 MB",
                iconName: "books.vertical.fill",
                accentColor: .cyan),
        .init(  title: "Work",
                fileCount: "300 Files",
                size: "Size: 56 MB",
                iconName: "bag",
                accentColor: .red),
        .init(  title: "Others",
                fileCount: "30 Files",
                size: "Size: 56 MB",
                iconName: "paperclip",
                accentColor: .cyan),
    ]
    
}
