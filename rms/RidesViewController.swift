//
//  ViewController.swift
//  rms
//
//  Created by Laura Artiles on 4/14/17.
//  Copyright © 2017 Laura Artiles. All rights reserved.
//

import UIKit

class RidesViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var totalMilesLabel: UILabel!
  let totalMilesLbl = UILabel()
  @IBOutlet weak var overallAverageSpeedLabel: UILabel!
  @IBOutlet weak var totalRidesLabel: UILabel!

  let cellIdentifier = "RideCellIdentifier"

  // TODO: delete this once we fetch real ride info from DB
  var rides = [Ride(for: "Monday"), Ride(for: "Saturday"), Ride(for: "Thursday")]

  override func viewDidLoad() {
    super.viewDidLoad()

    // Set up table view
    tableView.delegate = self
    tableView.dataSource = self
    self.view.addSubview(self.tableView)

    setUpFakeData()
  }

  // TODO: delete this once we fetch rider info from DB
  private func setUpFakeData() {
    totalMilesLabel.text = "107.0"
    overallAverageSpeedLabel.text = "15"
    totalRidesLabel.text = "17"
  }

  private func setUpLabels() {
    totalMilesLbl.text = "100.0"
    totalMilesLbl.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(totalMilesLbl)
    totalMilesLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    totalMilesLbl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 50.0).isActive = true
  }

  // MARK: - Navigation

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
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

extension RidesViewController: UITableViewDelegate { }

extension RidesViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    // TODO: set value to number of months
    return 1
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // TODO: return number of rides for given month
    return self.rides.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell =  tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RideTableViewCell

    // Fetch rides
    let ride = self.rides[indexPath.row]
    
    // Configure cell
    cell.rideTitle.text = ride.description
    cell.rideDistance.text = "\(ride.distance) miles"
    cell.ridePaceLabel.text = "\(ride.pace) mph"

    return cell
  }
}

