//
//  CompendiumViewModel.swift
//  Compedium
//
//  Created by tommy yohanes on 14/08/24.
//

import Foundation
import Combine

@MainActor
class CompendiumViewModel: ObservableObject {
    @Published var entries: [Entry] = []
    @Published var selectedEntry: Entry?
    @Published var error: Error? {
        didSet {
            isErrorPresented = error != nil
        }
    }
    @Published var isErrorPresented: Bool = false

    private let repository: CompendiumRepositoryProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(repository: CompendiumRepositoryProtocol = CompendiumRepository()) {
        self.repository = repository
        fetchEntries()
    }
    
    func fetchEntries() {
        repository.fetchEntries()
            .sink(receiveCompletion: { [weak self] completion in
                if case .failure(let error) = completion {
                    self?.error = error
                }
            }, receiveValue: { [weak self] entries in
                self?.entries = entries.data
            })
            .store(in: &cancellables)
    }
    
    func fetchEntry(by id: Int) {
        repository.fetchEntry(by: id)
            .sink(receiveCompletion: { [weak self] completion in
                if case .failure(let error) = completion {
                    self?.error = error
                }
            }, receiveValue: { [weak self] entry in
                self?.selectedEntry = entry.data
            })
            .store(in: &cancellables)
    }
}
