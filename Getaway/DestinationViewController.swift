//
//  DestinationViewController.swift
//  Getaway
//
//  Created by Andrés Serna on 11/10/25.
//

import UIKit
import MapKit

class DestinationViewController: UIViewController {

    var package: TravelPackage?
    
    
    @IBOutlet weak var view_insideScrollView: UIView!
    @IBOutlet weak var view_mapView: MKMapView!
    @IBOutlet weak var view_scrollView: UIScrollView!
    @IBOutlet weak var lbl_destination: UILabel!
    @IBOutlet weak var lbl_dates: UILabel!
    @IBAction func btn_viewPasses(_ sender: UIButton) {
    }
    
    @IBAction func btn_findAirports(_ sender: UIButton) {
    }
    
    @IBOutlet weak var btn_findAirportsOutlet: UIButton!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            addContentBelowButton()
        }
        
    func addContentBelowButton() {
        guard let contentView = view_insideScrollView else { return }
        
        // Keep track of the last element to chain constraints
        var lastElement: UIView = btn_findAirportsOutlet
        
        // Add multiple sections to demonstrate scrolling
    }


}
