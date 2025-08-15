//
//  NotesDatabase.swift
//  AI-Notes
//
//  Created by Suraj-KU on 04/08/25.
//

import Foundation
import SwiftData

@Model
final class NotesDatabase{
    var id = UUID()
    @Relationship(deleteRule: .cascade, inverse: \NotesCardDataBase.notes)
    
    var notes: NotesCardDataBase
    var title : String
    var notesDescription : String
    
    
    init(notes: NotesCardDataBase, title: String, notesDescription: String) {
        self.notes = notes
        self.title = title
        self.notesDescription = notesDescription
    }
    
    
    
    
}

struct StringDataConverter {
    static func convertAttributedStringToArchivedData(_ attributedString: NSAttributedString) -> Data? {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: attributedString, requiringSecureCoding: false)
            return data
        } catch {
            print("Failed to archive NSAttributedString: \(error)")
            return nil
        }
    }
    
}


extension NSAttributedString {
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



