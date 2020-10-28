//
//  BreweriesCell.swift
//  BreweriesList
//
//  Created by Alex Kiritsa on 28.10.2020.
//

import UIKit

class BreweriesCell: UITableViewCell {

    static let reuseId = "BreweriesCell"
    var viewModel: BreweriesCellViewModelType! {
        didSet {
            configCell(breweries: viewModel.breweries)
        }
    }

    @IBOutlet weak var cardView: UIView! {
        didSet {
            cardView.layer.borderWidth = 2
            cardView.layer.borderColor = UIColor(red: 45/255, green: 136/255, blue: 3/255, alpha: 1).cgColor
            cardView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()

    }

    func configCell(breweries: Breweries) {

        titleLabel.text = breweries.name
        countryLabel.attributedText = coloredText(text: "Country: ", coloredText: breweries.country)
        stateLabel.attributedText = coloredText(text: "State: ", coloredText: breweries.state)
        cityLabel.attributedText = coloredText(text: "City: ", coloredText: breweries.city)
        streetLabel.attributedText = coloredText(text: "Street: ", coloredText: breweries.street)

        if breweries.phone != "" {
            phoneLabel.attributedText = coloredText(text: "Phone: ", coloredText: breweries.phone)
            phoneLabel.isEnabled = true
        } else {
            phoneLabel.isEnabled = false
        }
        if breweries.websiteURL != "" {
            websiteLabel.attributedText = coloredText(text: "Website: ", coloredText: breweries.websiteURL)
            websiteLabel.isEnabled = true
        } else {
            websiteLabel.isEnabled = false
        }
    }

    private func coloredText(text: String, coloredText: String) -> NSAttributedString {
        let string = text + coloredText
        let range = (string as NSString).range(of: coloredText)
        let mutableAttributedString = NSMutableAttributedString.init(string: string)
        mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(red: 69/255, green: 69/255, blue: 69/255, alpha: 1), range: range)

        return mutableAttributedString
    }

    override func prepareForReuse() {
        titleLabel.text = nil
        countryLabel.text = nil
        stateLabel.text = nil
        cityLabel.text = nil
        streetLabel.text = nil
        phoneLabel.text = nil
        websiteLabel.text = nil
    }
}
