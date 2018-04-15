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
  private var rideTitleLabel = UILabel()
  private var rideDistanceLabel = UILabel()
  private var rideAverageSpeedLabel = UILabel()
  private var rideDurationLabel = UILabel()
  private var rideElevationGainLabel = UILabel()
  private var rideCaloriesLabel = UILabel()

  var ride: Ride?
  
  override func viewDidLoad() {
    super.viewDidLoad()

    setUpSubviews()
    populateRideInfo()
  }

  private func setUpSubviews() {
    let subviews = [rideTitleLabel, rideDistanceLabel,
                    rideAverageSpeedLabel, rideDurationLabel,
                    rideElevationGainLabel, rideCaloriesLabel]
    subviews.forEach { subview in
      subview.translatesAutoresizingMaskIntoConstraints = false
      view.addSubview(subview)
    }

    NSLayoutConstraint.activate([
      rideTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20.0),
      rideTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      rideDistanceLabel.topAnchor.constraint(equalTo: rideTitleLabel.bottomAnchor, constant: 75.0),
      rideDistanceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      ])
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
