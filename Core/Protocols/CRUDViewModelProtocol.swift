//
//  DashboardViewModelProtocol.swift
//  AI-Notes
//
//  Created by Suraj-KU on 05/08/25.
//

import Foundation
import SwiftData

protocol CRUDViewModelProtocol{
    associatedtype Model
    func loadItems()
    func addItem(_ item: Model)
    func updateItem(_ item: Model)
    func deleteItem(_ item: Model)
}
