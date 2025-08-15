//
//  DashBoardViewModel.swift
//  AI-Notes
//
//  Created by Suraj-KU on 05/08/25.
//

import Combine
import SwiftData
import Foundation


class NotesCardViewModel: ObservableObject , CRUDViewModelProtocol {
    @Published var items: [NotesCardDataBase] = []

    private let DataBaseRepository: DataBaseRepository<NotesCardDataBase>

    init(DataBaseRepository: DataBaseRepository<NotesCardDataBase>) {
        self.DataBaseRepository = DataBaseRepository
    }

    func loadItems() {
        items = DataBaseRepository.fetchAll()
    }

    func addItem(_ item: NotesCardDataBase) {
        DataBaseRepository.add(item)
        loadItems()
    }

    func updateItem(_ item: NotesCardDataBase) {
        DataBaseRepository.update(item)
        loadItems()
    }

    func deleteItem(_ item: NotesCardDataBase) {
        DataBaseRepository.delete(item)
        loadItems()
    }
}
