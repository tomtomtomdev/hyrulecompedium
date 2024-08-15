//
//  Model.swift
//  Compedium
//
//  Created by tommy yohanes on 14/08/24.
//

import Foundation

struct Entry: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let image: String
    let category: String
}

struct EntryResponse: Codable {
    let data: Entry
}

struct AllEntryResponse: Codable {
    let data: [Entry]
}
