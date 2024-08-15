//
//  CompendiumRepository.swift
//  Compedium
//
//  Created by tommy yohanes on 14/08/24.
//

import Foundation
import Combine

protocol CompendiumRepositoryProtocol {
    func fetchEntries() -> AnyPublisher<AllEntryResponse, Error>
    func fetchEntry(by id: Int) -> AnyPublisher<EntryResponse, Error>
}

class CompendiumRepository: CompendiumRepositoryProtocol {
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchEntries() -> AnyPublisher<AllEntryResponse, Error> {
        return networkService.fetch(.entries, responseType: AllEntryResponse.self)
    }
    
    func fetchEntry(by id: Int) -> AnyPublisher<EntryResponse, Error> {
        return networkService.fetch(.entry(id: id), responseType: EntryResponse.self)
    }
}
