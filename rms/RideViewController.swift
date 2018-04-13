//
//  RideViewController.swift
//  rms
//
//  Created by Artiles, Laura on 4/20/17.
//  Copyright © 2017 Laura Artiles. All rights reserved.
//

import UIKit

class RideViewController: UIViewController {
  // TODO: Make these a stack view
  @IBOutlet weak var rideTitleLabel: UILabel!
  @IBOutlet weak var rideDistanceLabel: UILabel!
  @IBOutlet weak var rideAverageSpeedLabel: UILabel!
  @IBOutlet weak var rideDurationLabel: UILabel!
  @IBOutlet weak var rideElevationGainLabel: UILabel!
  @IBOutlet weak var rideCaloriesLabel: UILabel!

  var ride: Ride?
  
  override func viewDidLoad() {
    super.viewDidLoad()

    populateRideInfo()
  }

  private func populateRideInfo() {
    rideTitleLabel.text = ride?.description
    if let rideDistance = ride?.distance {
      rideDistanceLabel.text = "\(rideDistance) mi"
    } else {
      rideDistanceLabel.text = "-- mi"
    }
    if let rideSpeed = ride?.pace {
      rideAverageSpeedLabel.text = "\(rideSpeed) mph"
    }
    else {
      rideAverageSpeedLabel.text = "-- mph"
    }
  }

  /// TODO: If a user edits ride info, update labels and push changes to DB
  private func updateRideInfo() {

  }
}
