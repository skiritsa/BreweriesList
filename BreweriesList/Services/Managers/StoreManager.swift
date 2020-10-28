//
//  StoreManager.swift
//  BreweriesList
//
//  Created by Alex Kiritsa on 27.10.2020.
//

import Foundation
import RealmSwift

class StoreManager {

    var realm: Realm
    var fetcher: DataFetcher

    init(realm: Realm, fetcher: DataFetcher = NetworkDataFetcher()) {
        self.realm = realm
        self.fetcher = fetcher
    }

    func updateDataFromInternet() {
        fetcher.getBreweries { data in
            guard let data = data else { return }
            for breweries in data {
                let realmBreweries = Breweries(breweriesResponse: breweries)
                self.saveObject(realmBreweries)
            }
        }
    }

    private func saveObject(_ breweries: Breweries) {
        do {
            try realm.write {
                realm.add(breweries, update: .modified)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
