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

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelPackages.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PackageCell", for: indexPath)
        let package = travelPackages[indexPath.row]
        cell.textLabel?.text = package.destination_name
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPackageDetail",
           let destination = segue.destination as? DestinationViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            destination.package = travelPackages[indexPath.row]
        }
    }


}

