//
//  WholeSaleMarketVC.swift
//  PatricksStore
//
//  Created by Admin on 16/09/21.
//

import UIKit

class WholeSaleMarketVC: UIViewController {

    //MARK: - IB Outlets
    @IBOutlet weak var lblTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        
        // Set status bar color
        Helper.StatusBarColor(view: self.view)
        
        // Title Label
        self.lblTitle.font = UIFont(name: "Barlow-SemiBold", size: 20)
        self.lblTitle?.textColor = .white
    }
    
    //MARK: - Button Actions
    
    // Back Button Action
    @IBAction func btnAcnBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

//MARK: - Table View Logic
extension WholeSaleMarketVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WholesaleTblCell") as! WholesaleTblCell
        cell.awakeFromNib()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Clicked at index = \(indexPath)")
    }
}
