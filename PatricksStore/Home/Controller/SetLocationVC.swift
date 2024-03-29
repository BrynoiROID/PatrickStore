//
//  SetLocationVC.swift
//  PatricksStore
//
//  Created by Admin on 24/08/21.
//

import UIKit

import GoogleMaps

import CoreLocation

import GooglePlaces

import MapKit

class SetLocationVC: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate{
    
    //MARK: - IB Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var mapView: GMSMapView!
    
    @IBOutlet weak var lblPlaceName: UILabel!
    
    var locationname = String()
    
    var addressType = String()
    
    var city = String()
    
    var zip = String()
    
    var country = String()
    
    var subThorough = String()
    
    var manager = CLLocationManager()
    
    var latitude = String()
    
    var longitude = String()
    
    var geocoder = CLGeocoder()
    
    let userLocationMarker = GMSMarker()
    
    var gPlace : GMSPlace?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        
        // Set status bar color
        Helper.StatusBarColor(view: self.view)
        
        self.setupMap()
        
        // Search Bar Settings
        if #available(iOS 13.0, *) {
            self.searchBar.updateHeight(height: 50.0)
            self.searchBar.searchBarStyle = .minimal
            self.searchBar.searchTextField.backgroundColor = .white
            self.searchBar.searchTextField.borderStyle = .none
            self.searchBar.searchTextField.layer.cornerRadius = 16
            self.searchBar.placeholder = "Search"
            self.searchBar.searchTextField.font = UIFont(name: "Barlow-Regular", size: 14)
            self.searchBar.searchTextField.textColor = Helper.colorFromHexString(hex: "#343434")
        } else {
            // Fallback on earlier versions
            self.searchBar.clearBackgroundColor()
        }
    }
    
    //MARK: - GooglePlace Map Select Time Logic
    
    
    //MARK: - Current Location Update Delegate
    
    func setupMap()
    {
        mapView.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest // Battery
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            manager.stopUpdatingLocation()
            let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude, longitude: location.coordinate.longitude, zoom: 0.0)
            mapView.mapType = GMSMapViewType.satellite
            mapView.camera = camera
            mapView.animate(to: camera)
            mapView.animate(toZoom: 14.0)
            mapView.isMyLocationEnabled = true
            mapView.settings.compassButton = true
            mapView.settings.myLocationButton = true
            mapView.settings.consumesGesturesInView = true
            userLocationMarker.isDraggable = true
            userLocationMarker.map = mapView
            self.latitude = String(location.coordinate.latitude)
            self.longitude = String(location.coordinate.longitude)
            
            CATransaction.begin()
            CATransaction.setAnimationDuration(2.0)
            userLocationMarker.position = location.coordinate // CLLocationCoordinate2D coordinate
            CATransaction.commit()
           // render(location)
            
        }
    }
    
    func render(_ location: CLLocation){
        
        geocoder.reverseGeocodeLocation(location) { (placemark, error) -> Void in
            if error != nil {
                print("THERE WAS AN ERROR")
            }
            else{
                if let place = placemark?[0]{
                    
                    if placemark!.count > 0 {
                        if let locationName = place.name {
                            self.locationname = String(locationName)
                        }
                        if let city = place.subAdministrativeArea {
                            self.city = String(city)
                        }
                        if let zip = place.isoCountryCode {
                            print(zip)
                            self.zip = String(zip)
                        }
                        if let country = place.country {
                            self.country = String(country)
                        }
                        if let subThoroughfare = place.subThoroughfare {
                            self.subThorough = String(subThoroughfare)
                        }
                        if place.subThoroughfare == nil{
                            self.subThorough = ""
                            self.userLocationMarker.title = self.city + ", " + self.locationname + ", " + self.zip
                        }else{
                            self.userLocationMarker.title = self.subThorough + ", " + self.city + ", " + self.locationname + ", " + self.zip
                        }
                        self.userLocationMarker.snippet = self.country
                        self.lblPlaceName.text = self.subThorough + " " + self.city + "," + " " + self.locationname + "," + " " + self.zip + "," + " " + self.country
                    }
                }
            }
        }
    }
    
    
    //MARK:- Marker Drag Delegate Methods
    
    func mapView(_ mapView: GMSMapView, didEndDragging marker: GMSMarker) {
        
        print(marker.position)
        let Location = marker.position
        latitude = String(Location.latitude)
        longitude = String(Location.longitude)
        let CurrentLocation = CLLocation(latitude: Location.latitude, longitude: Location.longitude)
        self.render(CurrentLocation)
    }
    func mapView(_ mapView: GMSMapView, didBeginDragging marker: GMSMarker) {
        
        print("didBeginDragging")
    }
    func mapView(_ mapView: GMSMapView, didDrag marker: GMSMarker) {
        
        print("didDrag")
    }
    
    //MARK: - Button Actions
    
    //Set Location Button Action
    @IBAction func setLocationButtonTapped(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Home", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}
