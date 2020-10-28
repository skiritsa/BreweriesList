//
//  Breweries.swift
//  BreweriesList
//
//  Created by Alex Kiritsa on 27.10.2020.
//

import RealmSwift

class Breweries: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var breweryType: String = ""
    @objc dynamic var street: String = ""
    @objc dynamic var city: String = ""
    @objc dynamic var state: String = ""
    @objc dynamic var postalCode: String = ""
    @objc dynamic var country: String = ""
    @objc dynamic var longitude: String = ""
    @objc dynamic var latitude: String = ""
    @objc dynamic var phone: String = ""
    @objc dynamic var websiteURL: String = ""

    convenience init(breweriesResponse: BreweryResponse) {
        self.init()
        self.id = breweriesResponse.id
        self.name = breweriesResponse.name
        self.breweryType = breweriesResponse.breweryType
        self.street = breweriesResponse.street
        self.city = breweriesResponse.city
        self.state = breweriesResponse.state
        self.postalCode = breweriesResponse.postalCode
        self.country = breweriesResponse.country
        self.longitude = breweriesResponse.longitude
        self.latitude = breweriesResponse.latitude
        self.phone = breweriesResponse.phone
        self.websiteURL = breweriesResponse.websiteUrl
    }

    override class func primaryKey() -> String? {
        return "id"
    }

    override class func indexedProperties() -> [String] {
        return ["name"]
    }
}
