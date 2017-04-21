//
//  ViewController.swift
//  rms
//
//  Created by Laura Artiles on 4/14/17.
//  Copyright © 2017 Laura Artiles. All rights reserved.
//

import UIKit

class RidesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var totalMilesLabel: UILabel!
  @IBOutlet weak var overallAverageSpeedLabel: UILabel!
  @IBOutlet weak var totalRidesLabel: UILabel!

  let cellIdentifier = "RideCellIdentifier"

  /// TODO: Make a Ride object
  var rides: [String] = []
  var rideDistance:Double?
  var ridePace:Double?

  override func viewDidLoad() {
    super.viewDidLoad()

    // Set up table view
    tableView.delegate = self
    tableView.dataSource = self
    self.view.addSubview(self.tableView)

    getRiderRidesInfo()

  }

  /// TODO: fetch rider info from DB
  func getRiderRidesInfo() {
    rides = ["Monday Morning Ride", "Saturday Morning Ride", "Thursday Afternoon Ride"]
    totalMilesLabel.text = "100.0"
    overallAverageSpeedLabel.text = "15 mph"
    totalRidesLabel.text = "17"
    rideDistance = 30.0
    ridePace = 15
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    // TODO: set value to number of months
    return 1
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return rides.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell =  tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RideTableViewCell

    // Fetch rides
    let ride = rides[indexPath.row]

    // Configure cell
    cell.rideTitle.text = ride
    if let rideDistance = rideDistance, let ridePace = ridePace {
      cell.rideDistance.text = "\(rideDistance) miles"
      cell.ridePaceLabel.text = "\(ridePace) mph"
    }
    else {
      cell.rideDistance.text = " -- miles"
      cell.ridePaceLabel.text = " -- mph"
    }

    return cell
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
      let ride = rides[indexPath.row]
      rideViewController.ride = ride
      rideViewController.rideDistance = rideDistance
      rideViewController.rideSpeed = ridePace
    }
  }
}

