//
//  HyruleCompendiumAPI.swift
//  Compedium
//
//  Created by tommy yohanes on 14/08/24.
//

import Foundation

enum HyruleCompendiumAPI {
    static let baseURL = "https://botw-compendium.herokuapp.com/api/v3/compendium/"

    case entries
    case entry(id: Int)
    
}

extension HyruleCompendiumAPI {
    
    var url: URL? {
        switch self {
        case .entries:
            return URL(string: "\(HyruleCompendiumAPI.baseURL)all")
        case .entry(let id):
            return URL(string: "\(HyruleCompendiumAPI.baseURL)entry/\(id)")
        }
    }
}
