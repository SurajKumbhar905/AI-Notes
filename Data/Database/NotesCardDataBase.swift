//
//  DataBaseModel.swift
//  AI-Notes
//
//  Created by Suraj-KU on 04/08/25.
//

import Foundation
import SwiftData
import SwiftUI

@Model
final class NotesCardDataBase{
    @Attribute(.unique) var id : String = UUID().uuidString
    var title : String
    var image : String
    var date : Date
    @Relationship var notes : [NotesDatabase]?
    
    init(title: String, image: String , date : Date ) {
        self.title = title
        self.image = image
        self.date = date
    }
    
}
