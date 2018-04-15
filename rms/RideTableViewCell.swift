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

    let subviews = [rideTitle, rideDistance, ridePaceLabel]
    subviews.forEach { subview in
      subview.translatesAutoresizingMaskIntoConstraints = false
      addSubview(subview)
    }

    NSLayoutConstraint.activate([
      rideTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
      rideTitle.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20.0),
      rideDistance.topAnchor.constraint(equalTo: rideTitle.bottomAnchor, constant: 6.0),
      rideDistance.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20.0),
      ridePaceLabel.topAnchor.constraint(equalTo: rideTitle.bottomAnchor, constant: 6.0),
      ridePaceLabel.leftAnchor.constraint(equalTo: rideDistance.rightAnchor, constant: 4.0)
      ])
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }

}
