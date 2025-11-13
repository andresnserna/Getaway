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
    
    
    @IBOutlet weak var lbl_entertainment2Description: UILabel!
    @IBOutlet weak var lbl_entertainment2Name: UILabel!
    @IBOutlet weak var lbl_entertainment1Description: UILabel!
    @IBOutlet weak var lbl_entertainment1Name: UILabel!
    @IBOutlet weak var lbl_hotel2Description: UILabel!
    @IBOutlet weak var lbl_hotel2Name: UILabel!
    @IBOutlet weak var lbl_hotel1Description: UILabel!
    @IBOutlet weak var lbl_hotel1Name: UILabel!
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
        
        populateLabels()
        setMapPins()
    
    }

    func populateLabels() {
        guard let package = package else { print("error loading package"); return }
        
        lbl_destination.text = package.destination_name
        lbl_dates.text = "\(package.trip_START) - \(package.trip_END)"
                
        lbl_hotel1Name.text = package.hotels[0].hotel_name
        lbl_hotel1Description.text = package.hotels[0].hotel_description
        lbl_hotel2Name.text = package.hotels[1].hotel_name
        lbl_hotel2Description.text = package.hotels[1].hotel_description
        
        lbl_entertainment1Name.text = package.entertainment[0].entertainment_name
        lbl_entertainment1Description.text = package.entertainment[0].entertainment_description
        lbl_entertainment2Name.text = package.entertainment[1].entertainment_name
        lbl_entertainment2Description.text = package.entertainment[1].entertainment_description
        
    }
    
    func setMapPins() {
        // hotel pins
        
        // entertainment pins
    }

}
