//
//  ViewController.swift
//  rms
//
//  Created by Laura Artiles on 4/14/17.
//  Copyright © 2017 Laura Artiles. All rights reserved.
//

import UIKit

class RidesViewController: UIViewController {
  let tableView = UITableView()
  let totalMilesLabel = UILabel()
  let overallAverageSpeedLabel = UILabel()
  let totalRidesLabel = UILabel()
  let totalMilesDescriptionLabel = UILabel()

  let rideCellIdentifier = "RideCellIdentifier"

  // TODO: delete this once we fetch real ride info from DB
  var rides = [Ride(for: "Monday"), Ride(for: "Saturday"), Ride(for: "Thursday")]

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setUpLabels()
    setUpTableView()
    setUpFakeData()
    setUpNavigationBarItems()
  }

  private func setUpTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(tableView)
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: totalMilesLabel.bottomAnchor, constant: 100.0),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
      tableView.leftAnchor.constraint(equalTo: view.leftAnchor)
      ])
    tableView.register(RideTableViewCell.self, forCellReuseIdentifier: rideCellIdentifier)
  }

  private func setUpNavigationBarItems() {
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "Image-1"), style: .plain, target: self, action: #selector(profileButtonTapped))
  }

  @objc private func profileButtonTapped() {
    let profileViewController = ProfileViewController()
    navigationController?.pushViewController(profileViewController, animated: true)
  }

  // TODO: delete this once we fetch rider info from DB
  private func setUpFakeData() {
    totalMilesLabel.text = "107.0"
    overallAverageSpeedLabel.text = "15"
    totalRidesLabel.text = "17"
  }

  private func setUpLabels() {
    totalMilesLabel.font = .systemFont(ofSize: 75.0)
    totalMilesLabel.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(totalMilesLabel)

    totalMilesDescriptionLabel.text = "Total Miles"
    totalMilesDescriptionLabel.font = .systemFont(ofSize: 15.0)
    totalMilesDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(totalMilesDescriptionLabel)

    NSLayoutConstraint.activate([
      totalMilesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      totalMilesLabel.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 50.0),
      totalMilesDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      totalMilesDescriptionLabel.topAnchor.constraint(equalTo: totalMilesLabel.bottomAnchor, constant: 6.0)
    ])
  }
}

extension RidesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rideViewController = RideViewController()
        tableView.deselectRow(at: indexPath, animated: false)
        navigationController?.pushViewController(rideViewController, animated: true)
    }
}

extension RidesViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    // TODO: set value to number of months
    return 1
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // TODO: return number of rides for given month
    return rides.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell =  tableView.dequeueReusableCell(withIdentifier: rideCellIdentifier, for: indexPath)
    guard let rideCell = cell as? RideTableViewCell else { return cell }

    // Fetch rides
    let ride = rides[indexPath.row]
    
    // Configure cell
    rideCell.rideTitle.text = ride.description
    rideCell.rideDistance.text = "\(ride.distance) miles"
    rideCell.ridePaceLabel.text = "\(ride.pace) mph"

    return rideCell
  }
}

