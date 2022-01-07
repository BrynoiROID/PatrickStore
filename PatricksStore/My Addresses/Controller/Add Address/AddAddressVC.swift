//
//  AddAddressVC.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 23/09/21.
//

import UIKit

import SkyFloatingLabelTextField

class AddAddressVC: UIViewController {

    //MARK: - IB Outlets
    @IBOutlet weak var bttnBack: UIButton!
    
    @IBOutlet weak var viewLocation: UIView!
    
    @IBOutlet weak var bttnLocation: UIButton!
    
    @IBOutlet weak var viewForm: UIView!
    
    @IBOutlet weak var pinCodeTextField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var houseNoTextField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var roadNameTextField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var cityTextField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var stateTextField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var landmarkTextField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var nameTextField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var mobileTextField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var bttnHome: UIButton!
    
    @IBOutlet weak var bttnOffice: UIButton!
    
    @IBOutlet weak var bttnOthers: UIButton!
    
    @IBOutlet weak var bttnSave: UIButton!
    
    
    //MARK: - Variables and Constants
    enum buttonSelection{
        case Home
        case Office
        case Others
    }
    
    enum buttonAddressType{
        case Add
        case Edit
    }
    
    var locationDelelgate : SetLocationButtonTapDelegate!
    
    var buttonTap = buttonSelection.Home
    
    var buttonAddress = buttonAddressType.Add
    
    var viewModel = AddAddressViewModel()
    
    var addressType = String()
    
    var addressId : String?
    
    var editDetails : AddAddressData?
    
    var latitude = String()
    
    var longitude = String()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    // MARK: - Initial Setup
    func initialSetup() {
        
        // Set status bar color
        Helper.StatusBarColor(view: self.view)
        
        // Set bottom shadow for view
        Helper.shadowSetViewBottom(view: self.viewLocation)
        Helper.shadowSetViewBottom(view: self.viewForm)
        
        // Set corner radius for button
        Helper.cornerSetButton(button: self.bttnHome, radiousValue: 20)
        Helper.cornerSetButton(button: self.bttnOffice, radiousValue: 20)
        Helper.cornerSetButton(button: self.bttnOthers, radiousValue: 20)
        
        // Set border width and color for button
        Helper.borderAndborderColourSetUIButton(button: self.bttnHome, borderWidth: 1.0, colour: UIColor.gray)
        Helper.borderAndborderColourSetUIButton(button: self.bttnOffice, borderWidth: 1.0, colour: UIColor.gray)
        Helper.borderAndborderColourSetUIButton(button: self.bttnOthers, borderWidth: 1.0, colour: UIColor.gray)
        
        //Edit address
        switch buttonAddress {
        case .Add:
            break
        case .Edit:
            checkConnectivityEditAddressAPI()
        }
    }
    
    // MARK: - Setup Address Type Button
    func addressTypeButtonSetup() {
        
        if self.buttonTap == .Home {
            Helper.borderAndborderColourSetUIButton(button: self.bttnHome, borderWidth: 0.0, colour: UIColor.clear)
            Helper.borderAndborderColourSetUIButton(button: self.bttnOffice, borderWidth: 1.0, colour: UIColor.gray)
            Helper.borderAndborderColourSetUIButton(button: self.bttnOthers, borderWidth: 1.0, colour: UIColor.gray)
            self.bttnHome.backgroundColor = Helper.colorFromHexString(hex: Helper.appThemeColor)
            self.bttnOffice.backgroundColor = UIColor.clear
            self.bttnOthers.backgroundColor = UIColor.clear
            
        } else if self.buttonTap == .Office {
            Helper.borderAndborderColourSetUIButton(button: self.bttnOffice, borderWidth: 0.0, colour: UIColor.clear)
            Helper.borderAndborderColourSetUIButton(button: self.bttnHome, borderWidth: 1.0, colour: UIColor.gray)
            Helper.borderAndborderColourSetUIButton(button: self.bttnOthers, borderWidth: 1.0, colour: UIColor.gray)
            self.bttnOffice.backgroundColor = Helper.colorFromHexString(hex: Helper.appThemeColor)
            self.bttnHome.backgroundColor = UIColor.clear
            self.bttnOthers.backgroundColor = UIColor.clear
            
        } else if self.buttonTap == .Others {
            Helper.borderAndborderColourSetUIButton(button: self.bttnOthers, borderWidth: 0.0, colour: UIColor.clear)
            Helper.borderAndborderColourSetUIButton(button: self.bttnHome, borderWidth: 1.0, colour: UIColor.gray)
            Helper.borderAndborderColourSetUIButton(button: self.bttnOffice, borderWidth: 1.0, colour: UIColor.gray)
            self.bttnOthers.backgroundColor = Helper.colorFromHexString(hex: Helper.appThemeColor)
            self.bttnOffice.backgroundColor = UIColor.clear
            self.bttnHome.backgroundColor = UIColor.clear
        }
    }
    
    // MARK: - Button Actions
    
    //MARK: -  Back Button Action
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: -  Location Button Action
    @IBAction func locationButtonTapped(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Home", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "SetLocationVC") as! SetLocationVC
        controller.locationSelect = .FetchlLocation
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    //MARK: - Save Button Action
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        switch buttonAddress {
        case .Add:
            checkConnectivityAddAddressAPI()
        case .Edit:
            checkConnectivityUpdateAddressAPI()
        }
    }
    
    // MARK: - Address Type Button Actions
    
    //MARK: -  Home Button Action
    @IBAction func homeButtonTapped(_ sender: UIButton) {
        self.buttonTap = .Home
        self.addressType = "Home"
        self.addressTypeButtonSetup()
    }
    //MARK: -  Office Button Action
    @IBAction func officeButtonTapped(_ sender: UIButton) {
        self.buttonTap = .Office
        self.addressType = "Office"
        self.addressTypeButtonSetup()
    }
    //MARK: -  Others Button Action
    @IBAction func othersButtonTapped(_ sender: UIButton) {
        self.buttonTap = .Others
        self.addressType = "Others"
        self.addressTypeButtonSetup()
    }
    //MARK: -  LandMark Button Action
    @IBAction func landMarkButtonTapped(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Home", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "SetLocationVC") as! SetLocationVC
        controller.locationSelect = .Address
        controller.locationDelelgate = self
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

//MARK:- Setting Location to LandMark TextField
extension AddAddressVC :SetLocationButtonTapDelegate{
    func locationSelection(location: String, lat: String, long: String) {
        self.landmarkTextField.text = location
        self.longitude = long
        self.latitude = lat
    }
}

//MARK:- API Call
extension AddAddressVC{
    //MARK:- Add Address API Call
    func checkConnectivityAddAddressAPI() {
        if Helper.checkInternetConnectivity() {
            if viewModel.AddAddressValid(pincode: pinCodeTextField.text!, houseno: houseNoTextField.text!, roadname: roadNameTextField.text!, city: cityTextField.text!, state: stateTextField.text!, landmark: landmarkTextField.text!, name: nameTextField.text!, mobilenumber: mobileTextField.text!){
                viewModel.AddAdresssAPI(name: nameTextField.text!, address1: roadNameTextField.text!, city: cityTextField.text!, state: stateTextField.text!, pincode: pinCodeTextField.text!, landMark: landmarkTextField.text!, label: self.addressType, lat: latitude, lng: longitude, contactNumber: mobileTextField.text!) {
                    DispatchQueue.main.async {
                        self.navigationController?.popViewController(animated: true)
                    }
                }
            }
        }else {
            Helper.showAlert(message: "Please check your Internet connection")
        }
    }
    
    //MARK:- Edit Address API Call
    func checkConnectivityEditAddressAPI() {
        if Helper.checkInternetConnectivity() {
                viewModel.EditAddressAPI(addressId: self.addressId!) { (result) in
                    self.editDetails = result
                    DispatchQueue.main.async {
                        self.showDetailAddress()
                    }
                }
        }else {
            Helper.showAlert(message: "Please check your Internet connection")
        }
    }
    
    //MARK:- Update Address API Call
    func checkConnectivityUpdateAddressAPI() {
        if Helper.checkInternetConnectivity() {
            if viewModel.AddAddressValid(pincode: pinCodeTextField.text!, houseno: houseNoTextField.text!, roadname: roadNameTextField.text!, city: cityTextField.text!, state: stateTextField.text!, landmark: landmarkTextField.text!, name: nameTextField.text!, mobilenumber: mobileTextField.text!){
                viewModel.UpdateAddressAPI(addressId:addressId!,name: nameTextField.text!, address1: roadNameTextField.text!, city: cityTextField.text!, state: stateTextField.text!, pincode: pinCodeTextField.text!, landMark: landmarkTextField.text!, label: self.addressType, lat: latitude, lng: longitude, contactNumber: mobileTextField.text!) { (result) in
                    DispatchQueue.main.async {
                        self.navigationController?.popViewController(animated: true)
                        Helper.showAlert(message: result.msg!)
                    }
                }
            }
        }else {
            Helper.showAlert(message: "Please check your Internet connection")
        }
    }
    //MARK:- Show Address Details
    func showDetailAddress(){
        self.pinCodeTextField.text = self.editDetails?.pincode
        self.houseNoTextField.text = self.editDetails?.address2
        self.roadNameTextField.text = self.editDetails?.address1
        self.cityTextField.text = self.editDetails?.city
        self.stateTextField.text = self.editDetails?.state
        self.landmarkTextField.text = self.editDetails?.landMark
        self.nameTextField.text = self.editDetails?.name
        self.mobileTextField.text = self.editDetails?.contactNumber
        if self.editDetails?.label == "Home"{
            self.buttonTap = .Home
        }else if self.editDetails?.label == "Office"{
            self.buttonTap = .Office
        }else{
            self.buttonTap = .Others
        }
        self.addressTypeButtonSetup()
    }
}
