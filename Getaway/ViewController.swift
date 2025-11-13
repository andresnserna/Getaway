//
//  ViewController.swift
//  Getaway
//
//  Created by Andrés Serna on 11/10/25.
//

import UIKit

class ViewController: UITableViewController{

    var travelPackages: [TravelPackage] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        travelPackages = loadPackages()  // Load data from JSON once
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DestinationViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            destination.package = travelPackages[indexPath.row]
        }
    }


}

