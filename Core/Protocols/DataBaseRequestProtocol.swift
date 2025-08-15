//
//  DataBaseRequestProtocol.swift
//  AI-Notes
//
//  Created by Suraj-KU on 08/08/25.
//

import Foundation

protocol DataBaseRequestProtocol{
    associatedtype Model 
    func add(_ data : Model)
    func fetchAll() ->[Model]
    func update(_ data:Model)
    func delete(_ data:Model)
}
