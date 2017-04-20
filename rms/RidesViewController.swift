//
//  ViewController.swift
//  rms
//
//  Created by Laura Artiles on 4/14/17.
//  Copyright © 2017 Laura Artiles. All rights reserved.
//

import UIKit

class RidesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  let cellIdentifier = "RideCellIdentifier"
  var rides: [String] = ["Monday Morning Ride", "Saturday Morning Ride", "Thursday Afternoon Ride"]

  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var totalMilesLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()

    // Set up table view
    tableView.delegate = self
    tableView.dataSource = self
    self.view.addSubview(self.tableView)

    totalMilesLabel.text = "100.0"
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func numberOfSections(in tableView: UITableView) -> Int {
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
    cell.rideDistance.text = "30.0 miles"
    cell.ridePaceLabel.text = "45'/ mile"
    

    return cell
  }

  // MARK: - Navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "RideSegue" {
      guard let indexPath = tableView.indexPathForSelectedRow else {
        return
      }

      // Get the destination view controller
      let rideViewController = segue.destination as! RideViewController

      tableView.deselectRow(at: indexPath, animated: false)

      // Pass in the selected ride to the new view controller
      let ride = rides[indexPath.row]
      rideViewController.ride = ride
    }
  }
}

