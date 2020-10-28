//
//  NetworkDataFetcher.swift
//  BreweriesList
//
//  Created by Alex Kiritsa on 27.10.2020.
//

import Foundation

protocol DataFetcher {
    func getBreweries(response: @escaping ([BreweryResponse]?) -> Void)
    func getBreweriesByName(name: String, response: @escaping ([BreweryResponse]?) -> Void)
}

struct NetworkDataFetcher: DataFetcher {

    let networking: Networking

    init(networking: Networking = NetworkService()) {
        self.networking = networking
    }

    func getBreweries(response: @escaping ([BreweryResponse]?) -> Void) {
        networking.request(path: API.breweries, params: nil) { (data, error) in
            if let error = error {
                print("Error received requesting data: \(error.localizedDescription)")
                response(nil)
            }

            let decoded = self.decodeJSON(type: [BreweryResponse].self, from: data)
            response(decoded)
        }
    }

    func getBreweriesByName(name: String, response: @escaping ([BreweryResponse]?) -> Void) {
        let params = ["by_name": name]
        networking.request(path: API.breweries, params: params) { (data, error) in
            if let error = error {
                print("Error received requesting data: \(error.localizedDescription)")
                response(nil)
            }

            let decoded = self.decodeJSON(type: [BreweryResponse].self, from: data)
            response(decoded)
        }
    }

    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let data = from, let response = try? decoder.decode(type.self, from: data) else { return nil}
        return response
    }
}
