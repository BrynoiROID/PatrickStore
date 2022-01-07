//
//  PaymentCompleteVC.swift
//  PatricksStore
//
//  Created by Admin on 22/09/21.
//

import UIKit

class PaymentCompleteVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        
        // Set status bar color
        Helper.StatusBarColor(view: self.view)
        
        // Navigate to Home Screen after 3 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let storyboard = UIStoryboard.init(name: "MyCart", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "OrderDetailsVC") as! OrderDetailsVC
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }

}
