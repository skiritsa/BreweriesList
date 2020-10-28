//
//  BreweryResponse.swift
//  BreweriesList
//
//  Created by Alex Kiritsa on 27.10.2020.
//

import Foundation

struct BreweryResponse: Codable {
    let id: Int
    let name: String
    let breweryType: String
    let street: String
    let city: String
    let state: String
    let postalCode: String
    let country: String
    let longitude: String
    let latitude: String
    let phone: String
    let websiteUrl: String
}
