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

//MARK: - SetLocation Button Tap Delegate
protocol SetLocationButtonTapDelegate {
    func locationSelection(location:String,lat:String,long:String)
}
class SetLocationVC: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate,UISearchBarDelegate{
    //MARK: - IB Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var mapView: GMSMapView!
    
    @IBOutlet weak var lblPlaceName: UILabel!
    
    enum LocationSelect{
        case Home
        case Address
        case FetchlLocation
    }
    
    var locationDelelgate : SetLocationButtonTapDelegate!
    
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
    
    var locationSelect = LocationSelect.Home
    
    var viewModel = SetLocationViewModel()
    
    var param : LocationSetParams?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    //MARK: - Initial Setup
    func initialSetup() {
        // Set status bar color
        Helper.StatusBarColor(view: self.view)
        // Setting up of Map
        self.setupMap()
        // Search Bar Settings
        if #available(iOS 13.0, *) {
            self.searchBar.delegate = self
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
    // MARK: - UISearch Bar Delegate Function
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.autocompleteClicked()
    }
    // MARK: - Google Places Autocomplete
    func autocompleteClicked() {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        // Specify the place data types to return.
//        let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt(GMSPlaceField.name.rawValue) |
//                                                    UInt(GMSPlaceField.placeID.rawValue) | UInt(GMSPlaceField.coordinate.rawValue))
        
        let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt(GMSPlaceField.name.rawValue) |
                                                 UInt(GMSPlaceField.formattedAddress.rawValue)  |
                                                  UInt(GMSPlaceField.addressComponents.rawValue) | UInt(GMSPlaceField.coordinate.rawValue))
        autocompleteController.placeFields = fields
        // Specify a filter.
        let filter = GMSAutocompleteFilter()
        filter.countries = ["in"]
        filter.type = .city
        autocompleteController.autocompleteFilter = filter
        // Display the autocomplete view controller.
        autocompleteController.modalPresentationStyle = .fullScreen
        present(autocompleteController, animated: true, completion: nil)
    }
    //MARK: - Current Location Update Delegate
    func setupMap(){
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
            render(location)
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
    //MARK: - Map Setup
    func mapSetupMarker(lat: Double,long: Double){
        self.mapView.clear()
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: 30.0)
        mapView.camera = camera
        mapView.animate(to: camera)
        mapView.animate(toZoom: 14.0)
        mapView.isMyLocationEnabled = true
        mapView.settings.compassButton = true
        mapView.settings.myLocationButton = true
        mapView.settings.consumesGesturesInView = true
        userLocationMarker.isDraggable = true
        userLocationMarker.map = mapView
        self.latitude = String(lat)
        self.longitude = String(long)
        userLocationMarker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let center = CLLocation(latitude: lat, longitude: long)
        render(center)
    }
    //MARK: - Marker Drag Delegate Methods
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
    //MARK: - Set Location Button Action
    @IBAction func setLocationButtonTapped(_ sender: UIButton) {
        switch locationSelect {
        case .Home:
            self.setToParamModel()
            self.checkConnectivitySetLocation()
        case .Address:
            self.locationDelelgate.locationSelection(location: self.subThorough + " " + self.city + "," + " " + self.locationname + "," + " " + self.zip + "," + " " + self.country, lat: latitude, long: longitude)
            self.navigationController?.popViewController(animated: true)
        case .FetchlLocation:
            self.navigationController?.popViewController(animated: true)
        }
    }
    //MARK: - Param Setup
    func setToParamModel(){
        self.param = LocationSetParams(deviceId: "abcdef", location: LocationParams(lat: self.latitude, lng: self.longitude))
    }
}
//MARK: - GMSLocation Setup
extension SetLocationVC:GMSAutocompleteViewControllerDelegate{
    // Handle the user's selection.
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
       // lblPlaceName.text = place.name
       // dismiss(animated: true, completion: nil)
        // Show HouseAndFlat
        if place.name?.description != nil {
            self.locationname = place.name?.description ?? ""
        }
        // Show latitude
        if place.coordinate.latitude.description.count != 0 {
            self.latitude = String(place.coordinate.latitude)
        }
        // Show longitude
        if place.coordinate.longitude.description.count != 0 {
            self.longitude = String(place.coordinate.longitude)
        }
        self.mapSetupMarker(lat: place.coordinate.latitude, long: place.coordinate.longitude)
        dismiss(animated: true, completion: nil)
    }
    // Handle the error.
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        print("Error: ", error.localizedDescription)
    }
    // User canceled the operation.
     func wasCancelled(_ viewController: GMSAutocompleteViewController) {
       dismiss(animated: true, completion: nil)
     }
}
//MARK: - API Calls
extension SetLocationVC{
    //MARK: - Location API
    func checkConnectivitySetLocation() {
        if Helper.checkInternetConnectivity() {
            viewModel.setLocationAPI(param: self.param!,completion: { [self](result) in
                DispatchQueue.main.async {
                    let storyBoard = UIStoryboard(name: "Home", bundle: nil)
                    let controller = storyBoard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                    self.navigationController?.pushViewController(controller, animated: true)
                }
            })
        } else {
            Helper.showAlert(message: "Please check your Internet connection")
        }
    }
}
