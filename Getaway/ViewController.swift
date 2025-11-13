//
//  ViewController.swift
//  Getaway
//
//  Created by Andrés Serna on 11/10/25.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as! AppDelegate
let context = appDelegate.persistentContainer.viewContext

class ViewController: UITableViewController{

    var travelPackages: [TravelPackage] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        travelPackages = loadPackages()  // Load data from JSON once
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPackageDetail",
           let destination = segue.destination as? DestinationViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            destination.package = travelPackages[indexPath.row]
        }
    }


}

