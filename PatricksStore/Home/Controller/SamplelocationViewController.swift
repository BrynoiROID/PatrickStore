//
//  SamplelocationViewController.swift
//  PatricksStore
//
//  Created by MacBook on 22/12/21.
//

import UIKit
import GoogleMaps
import GooglePlaces

class SamplelocationViewController: UIViewController, GMSMapViewDelegate {
    @IBOutlet weak var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        mapView.camera = camera
 
                // Creates a marker in the center of the map.
                let marker = GMSMarker()
                marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
                marker.title = "Sydney"
                marker.snippet = "Australia"
                marker.map = mapView
          }
         // Do any additional setup after loading the view.
    }
    

    


