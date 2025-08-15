//
//  DatabaseDataBseRepository.swift
//  AI-Notes
//
//  Created by Suraj-KU on 08/08/25.
//

import Foundation
import SwiftData
import SwiftUI

class DataBaseRepository<T : PersistentModel> : DataBaseRequestProtocol{
    
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext
    
    @MainActor
    init() {
        self.modelContainer = try! ModelContainer(for: T.self, configurations: ModelConfiguration(isStoredInMemoryOnly: false))
        self.modelContext = modelContainer.mainContext
    }
    
    func add(_ data: T) {
        modelContext.insert(data)
        saveContext()
    }
    
    func fetchAll() -> [T] {
        do {
            let descriptor = FetchDescriptor<T>(sortBy: [])
            return try modelContext.fetch(descriptor)
        } catch {
            print("Failed fetching data: \(error)")
            return []
        }
    }
    
    func update(_ data: T) {
        
    }
    
    func delete(_ data: T) {
        modelContext.delete(data)
        saveContext()
    }
    
    
    private func saveContext() {
        do {
            try modelContext.save()
        } catch {
            print("Failed saving context: \(error)")
        }
    }
    
    
}

