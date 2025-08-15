//
//  NotesViewModel.swift
//  AI-Notes
//
//  Created by Suraj-KU on 10/08/25.
//

import Foundation
import Combine

class NotesViewModel : ObservableObject , CRUDViewModelProtocol{
   
    @Published var items: [NotesDatabase] = []
    
    private let DataBaseRepository: DataBaseRepository<NotesDatabase>

    init(DataBaseRepository: DataBaseRepository<NotesDatabase>) {
        self.DataBaseRepository = DataBaseRepository
    }

    func loadItems() {
        items = DataBaseRepository.fetchAll()
        print(items,"itemsss")
    }

    func addItem(_ item: NotesDatabase) {
        DataBaseRepository.add(item)
        loadItems()
    }

    func updateItem(_ item: NotesDatabase) {
        DataBaseRepository.update(item)
        loadItems()
    }

    func deleteItem(_ item: NotesDatabase) {
        DataBaseRepository.delete(item)
        loadItems()
    }
    
}
