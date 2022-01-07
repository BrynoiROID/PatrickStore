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
    
    var buttonTap = buttonSelection.Home
     
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
    
    // Back Button Action
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // Location Button Action
    @IBAction func locationButtonTapped(_ sender: UIButton) {

    }
    
    // Save Button Action
    @IBAction func saveButtonTapped(_ sender: UIButton) {

    }
    
    // MARK: - Address Type Button Actions
    
    // Home Button Action
    @IBAction func homeButtonTapped(_ sender: UIButton) {
        self.buttonTap = .Home
        self.addressTypeButtonSetup()
    }
    // Office Button Action
    @IBAction func officeButtonTapped(_ sender: UIButton) {
        self.buttonTap = .Office
        self.addressTypeButtonSetup()
    }
    // Others Button Action
    @IBAction func othersButtonTapped(_ sender: UIButton) {
        self.buttonTap = .Others
        self.addressTypeButtonSetup()
    }
}
