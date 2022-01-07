//
//  OTPVC.swift
//  PatricksStore
//
//  Created by Admin on 18/08/21.
//

import UIKit
import SVPinView

class OTPVC: UIViewController {
    
    @IBOutlet weak var pinView: SVPinView!
    
    var viewModel = OtpViewModel()
    
    var otp : String = ""
    
    var codeNo : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        
        // Set status bar color
        Helper.StatusBarColor(view: self.view)
        
        // Set Pin View Font
        pinView.font = UIFont(name: "Barlow-SemiBold", size: 34)!
        // Call Back Pin change
        pinView.didFinishCallback = didFinishEnteringPin(pin:)
        pinView.didChangeCallback = { pin in
            print("The entered pin is \(pin)")
        }
    }
    
    //MARK:- Call Back Pin
    func didFinishEnteringPin(pin:String) {
        print("The entered pin is \(pin)")
        self.codeNo = pin
    }
    //MARK: - Verify Button Action
    @IBAction func btnAcnVerify(_ sender: UIButton) {
        otpApiCheckConnectivity()
    }
    
    //MARK: - Back Button Action
    @IBAction func btnAcnBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
//MARK:- API CALL
extension OTPVC{
    func otpApiCheckConnectivity() {
        if Helper.checkInternetConnectivity() {
            if viewModel.isValid(otp: self.otp,codeno: self.codeNo) {
                viewModel.OtpAPI(otp: self.otp) { (result) in
                    DispatchQueue.main.async {
                    let storyBoard = UIStoryboard(name: "Home", bundle: nil)
                    let controller = storyBoard.instantiateViewController(withIdentifier: "SetLocationVC") as! SetLocationVC
                    self.navigationController?.pushViewController(controller, animated: true)
                    }
                }
            }
        }else {
            Helper.showAlert(message: "Please check your Internet connection")
        }
    }
}
