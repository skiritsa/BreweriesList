//
//  BreweriesViewModel.swift
//  BreweriesList
//
//  Created by Alex Kiritsa on 28.10.2020.
//

import Foundation
import RealmSwift

protocol BreweriesViewModelType {
    func numberOfRows() -> Int
    func cellViewModel(at indexPath: IndexPath) -> BreweriesCellViewModelType
}

class BreweriesViewModel: BreweriesViewModelType {

    var arrayBreweries: Results<Breweries>!

    init() {
        guard let realm = try? Realm() else { return }
        arrayBreweries = realm.objects(Breweries.self)
    }

    func numberOfRows() -> Int {
        return arrayBreweries.count
    }

    func cellViewModel(at indexPath: IndexPath) -> BreweriesCellViewModelType {
        let cellViewModel = BreweriesCellViewModel(breweries: arrayBreweries[indexPath.row])
        return cellViewModel
    }
}
