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
        // Don't call populateLabels() or setMapPins() here
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        guard let package = package else { return }
        
        // Remove any existing annotations (added from last view possibly)
        view_mapView.removeAnnotations(view_mapView.annotations)
        
        // Adding hotel pins
        for hotel in package.hotels {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(
                latitude: hotel.hotel_latitude,
                longitude: hotel.hotel_longitude
            )
            annotation.title = hotel.hotel_name
            view_mapView.addAnnotation(annotation)
        }
        
        // Add entertainment pins
        for entertainment in package.entertainment {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(
                latitude: entertainment.entertainment_latitude,
                longitude: entertainment.entertainment_longitude
            )
            annotation.title = entertainment.entertainment_name
            view_mapView.addAnnotation(annotation)
        }
        
        // Set the proper zoom to show all pins
        setMapZoom()
    }

    func setMapZoom() {
        guard let package = package else { return }
        
        var coordinates: [CLLocationCoordinate2D] = []
        
        for hotel in package.hotels {
            coordinates.append(CLLocationCoordinate2D(
                latitude: hotel.hotel_latitude,
                longitude: hotel.hotel_longitude
            ))
        }
        
        for entertainment in package.entertainment {
            coordinates.append(CLLocationCoordinate2D(
                latitude: entertainment.entertainment_latitude,
                longitude: entertainment.entertainment_longitude
            ))
        }
        
        guard !coordinates.isEmpty else { return }
        
        // Calculate the center point and span to show all annotations
        var minLat = coordinates[0].latitude
        var maxLat = coordinates[0].latitude
        var minLon = coordinates[0].longitude
        var maxLon = coordinates[0].longitude
        
        for coordinate in coordinates {
            minLat = min(minLat, coordinate.latitude)
            maxLat = max(maxLat, coordinate.latitude)
            minLon = min(minLon, coordinate.longitude)
            maxLon = max(maxLon, coordinate.longitude)
        }
        
        let center = CLLocationCoordinate2D(
            latitude: (minLat + maxLat) / 2,
            longitude: (minLon + maxLon) / 2
        )
        
        let span = MKCoordinateSpan(
            latitudeDelta: (maxLat - minLat) * 1.5,  // 1.5 adds padding
            longitudeDelta: (maxLon - minLon) * 1.5
        )
        
        let region = MKCoordinateRegion(center: center, span: span)
        view_mapView.setRegion(region, animated: true)
    }

}
