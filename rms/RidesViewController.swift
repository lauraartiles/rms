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
    setUpTableView()
    setUpLabels()
    setUpFakeData()
  }

    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200.0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
        tableView.register(RideTableViewCell.self, forCellReuseIdentifier: rideCellIdentifier)
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

  // MARK: - Navigation

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // delete once everything is converted to code and storyboard is removed
    if segue.identifier == "RideSegue" {
      guard let indexPath = tableView.indexPathForSelectedRow else {
        return
      }

      // Get the destination view controller
      guard let rideViewController = segue.destination as? RideViewController else {
        return
      }

      tableView.deselectRow(at: indexPath, animated: false)

      // Pass in the selected ride to the new view controller
      rideViewController.ride = rides[indexPath.row]
    }
  }
}

extension RidesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rideViewController = RideViewController()
        navigationController?.pushViewController(rideViewController, animated: true) // fix me!
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

