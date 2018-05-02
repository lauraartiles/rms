//
//  RideTableViewCell.swift
//  rms
//
//  Created by Artiles, Laura on 4/20/17.
//  Copyright © 2017 Laura Artiles. All rights reserved.
//

import UIKit

class RideTableViewCell: UITableViewCell {
  let rideTitle = UILabel()
  let rideDistance = UILabel()
  let ridePaceLabel = UILabel()

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setUpCell()
  }

  private func setUpCell() {
    rideTitle.translatesAutoresizingMaskIntoConstraints = false
    ridePaceLabel.translatesAutoresizingMaskIntoConstraints = false
    rideDistance.translatesAutoresizingMaskIntoConstraints = false
    addSubview(rideTitle)
    addSubview(rideDistance)
    addSubview(ridePaceLabel)
    NSLayoutConstraint.activate([
      rideTitle.topAnchor.constraint(equalTo: topAnchor, constant: 5.0),
      rideTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 30.0),
      rideDistance.topAnchor.constraint(equalTo: rideTitle.bottomAnchor, constant: 5.0),
      rideDistance.leftAnchor.constraint(equalTo: leftAnchor, constant: 30.0),
      ridePaceLabel.topAnchor.constraint(equalTo: rideDistance.topAnchor),
      ridePaceLabel.leftAnchor.constraint(equalTo: rideDistance.rightAnchor, constant: 15.0)
      ])
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
