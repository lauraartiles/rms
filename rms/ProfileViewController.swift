//
//  ProfileViewController.swift
//  rms
//
//  Created by Artiles, Laura on 4/20/17.
//  Copyright © 2017 Laura Artiles. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  let profileTableView = UITableView()
  let profileImageView = UIImageView()

  let cellIdentifier = "settingsCell"
  let settingsInfo = ["Name", "Route"]
  let settingsDetail = ["Othan Peroni", "Sierra"]

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white


    // Set up table view
    profileTableView.delegate = self
    profileTableView.dataSource = self
    view.addSubview(profileTableView)
  }

  private func setUpImageView() {
    profileImageView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(profileImageView)
    NSLayoutConstraint.activate([
      profileImageView.centerXAnchor.constraint(equalTo: view.rightAnchor),
      profileImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 25.0)
      ])
    profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
    profileImageView.clipsToBounds = true
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return settingsInfo.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell = UITableViewCell(style: .value2, reuseIdentifier: nil)
    cell =  tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

    // Configure cell
    cell.textLabel?.text = settingsInfo[indexPath.row]
    cell.detailTextLabel?.text = settingsDetail[indexPath.row]

    return cell
  }
}
