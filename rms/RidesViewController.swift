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
    var rides: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rides = ["ride1", "ride2", "ride3"]
        // Do any additional setup after loading the view, typically from a nib.
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
        let cell =  tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        // Fetch rides
        let ride = rides[indexPath.row]
        
        // configure cell
        cell.textLabel?.text = ride
        
        return cell
    }
}

