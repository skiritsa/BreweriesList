//
//  BreweriesViewController.swift
//  BreweriesList
//
//  Created by Alex Kiritsa on 27.10.2020.
//

import UIKit

class BreweriesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewModel: BreweriesViewModelType!

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = BreweriesViewModel()
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 45/255, green: 136/255, blue: 3/255, alpha: 1)

        tableView.register(UINib(nibName: "BreweriesCell", bundle: nil), forCellReuseIdentifier: BreweriesCell.reuseId)
    }
}

extension BreweriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(BreweriesCell.reuseId), for: indexPath) as? BreweriesCell else { return UITableViewCell() }

        cell.viewModel = viewModel.cellViewModel(at: indexPath)
        return cell
    }
}
