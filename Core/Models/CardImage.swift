//
//  CardImage.swift
//  AI-Notes
//
//  Created by Suraj-KU on 09/08/25.
//

import Foundation

enum CardImage: String, CaseIterable, Identifiable {
    case document = "document.on.document"
    case book = "books.vertical.fill"
    case bag = "bag"
    case paperClip = "paperclip"
    case light = "book.pages"
    case dark = "list.bullet"
    case system = "signature"
    case plug = "ev.plug.ac.gb.t"
    
    var id: String { self.rawValue }
}
