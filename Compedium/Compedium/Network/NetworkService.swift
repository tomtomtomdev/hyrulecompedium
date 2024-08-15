//
//  NetworkService.swift
//  Compedium
//
//  Created by tommy yohanes on 14/08/24.
//

import Foundation
import Combine

protocol NetworkServiceProtocol {
    func fetch<T: Decodable>(_ endpoint: HyruleCompendiumAPI, responseType: T.Type) -> AnyPublisher<T, Error>
}

class NetworkService: NetworkServiceProtocol {
    func fetch<T: Decodable>(_ endpoint: HyruleCompendiumAPI, responseType: T.Type) -> AnyPublisher<T, Error> {
        guard let url = endpoint.url else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
