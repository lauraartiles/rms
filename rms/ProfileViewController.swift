//
//  ProfileViewController.swift
//  rms
//
//  Created by Artiles, Laura on 4/20/17.
//  Copyright © 2017 Laura Artiles. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  @IBOutlet weak var profileTableView: UITableView!
  @IBOutlet weak var profileImageView: UIImageView!
  let cellIdentifier = "settingsCell"
  let settingsInfo = ["Name", "Route"]
  let settingsDetail = ["Othan Peroni", "Sierra"]
  override func viewDidLoad() {
    super.viewDidLoad()
    profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
    profileImageView.clipsToBounds = true

    // Set up table view
    profileTableView.delegate = self
    profileTableView.dataSource = self
    self.view.addSubview(profileTableView)

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
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
