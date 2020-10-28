//
//  BreweriesCellViewModel.swift
//  BreweriesList
//
//  Created by Alex Kiritsa on 28.10.2020.
//

import Foundation

protocol BreweriesCellViewModelType {
    var breweries: Breweries { get set }
}

class BreweriesCellViewModel: BreweriesCellViewModelType {

    var breweries: Breweries

    init(breweries: Breweries) {
        self.breweries = breweries
    }
}
