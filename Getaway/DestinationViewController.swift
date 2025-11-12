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
        addContentBelowButton()
        addContentBelowButton()
        addContentBelowButton()

        // Do any additional setup after loading the view.
    }
    
    func addContentBelowButton() {
        guard let contentView = view_insideScrollView else { return }
        
        // Example heading label
        let heading = UILabel()
        heading.text = "More Info"
        heading.font = .boldSystemFont(ofSize: 24)
        heading.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(heading)

        // Example description
        let description = UILabel()
        description.text = "This is some extra information that appears below the button."
        description.font = .systemFont(ofSize: 16)
        description.numberOfLines = 0
        description.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(description)

        // Constrain heading below the button
        NSLayoutConstraint.activate([
            heading.topAnchor.constraint(equalTo: btn_findAirportsOutlet.bottomAnchor, constant: 40),
            heading.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            heading.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            description.topAnchor.constraint(equalTo: heading.bottomAnchor, constant: 12),
            description.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            description.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            description.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
        
        // anchor bottom of last element to contentView.bottomAnchor
        // So scroll view knows how tall the content is
        description.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
    }


}
