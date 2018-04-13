//
//  LeaderboardViewController.swift
//  rms
//
//  Created by Artiles, Laura on 10/20/17.
//  Copyright © 2017 Laura Artiles. All rights reserved.
//

import UIKit

class LeaderboardViewController: UIViewController {
  let tableView = UITableView()
  let riders = [Rider(named: "Othan", route: "Sierra"),
                Rider(named: "Lauris", route: "Sierra"),
                Rider(named: "Nugget", route: "Ozarks")]
  fileprivate let cellIdentifier = "LeaderboardCellIdentifier"

  override func viewDidLoad() {
    super.viewDidLoad()

    // Set up table view
    tableView.delegate = self
    tableView.dataSource = self
    setUpTableView()
  }

  private func setUpTableView() {
    tableView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(tableView)
    tableView.leftAnchor.constraint(equalTo: view.leftAnchor)
    tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    tableView.topAnchor.constraint(equalTo: view.topAnchor)
  }
}

extension LeaderboardViewController: UITableViewDelegate { }

extension LeaderboardViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // TODO: return number of riders
    return 60
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

    // Fetch rider
    let rider = riders[indexPath.row]

    // Configure cell
    cell.textLabel?.text = rider.name

    return cell
  }
}
