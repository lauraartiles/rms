//
//  RideViewController.swift
//  rms
//
//  Created by Artiles, Laura on 4/20/17.
//  Copyright © 2017 Laura Artiles. All rights reserved.
//

import UIKit

class RideViewController: UIViewController {
  @IBOutlet weak var rideTitleLabel: UILabel!

  var ride:String?
  override func viewDidLoad() {
    super.viewDidLoad()

    populateRideInfo()
  }

  private func populateRideInfo() {
    rideTitleLabel.text = ride
  }

  /// TODO: If a user edits ride info, update labels and push changes to DB
  private func updateRideInfo() {

  }
}
