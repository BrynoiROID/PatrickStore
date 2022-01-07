//
//  ServiceDetailsVC.swift
//  PatricksStore
//
//  Created by Admin on 08/10/21.
//

import UIKit

class ServiceDetailsVC: UIViewController {

    //MARK: - IB Outlets
    @IBOutlet weak var imgService: UIImageView!
    
    @IBOutlet weak var lblServiceTitle: UILabel!
    
    @IBOutlet weak var lblNewPrice: UILabel!
    
    @IBOutlet weak var lblOldPrice: UILabel!
    
    @IBOutlet weak var tblServiceDetails: UITableView!
    
    @IBOutlet weak var tblServiceDetailsHeight: NSLayoutConstraint!
    
    @IBOutlet weak var shadowView: UIView!
    
    //MARK: - Variables and Constants
    let bulletsTextArray = ["But I must explain to you how all","this mistaken idea of denouncing pleasure","and praising pain was born and I will give","you a complete account of the system","and expound the actual","teachings of the great explorer of"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    // MARK: - Initial Setup
    func initialSetup() {
        
        // Set status bar color
        Helper.StatusBarColor(view: self.view)
        
        // Set Bottom Shadow
        Helper.shadowSetViewBottom(view: shadowView)
        
        // Old Price Label
        lblOldPrice.attributedText = lblOldPrice.text?.strikeThrough()
        
        // Service Details Label
        tblServiceDetails.delegate = self
        tblServiceDetails.dataSource = self
        tblServiceDetails.isScrollEnabled = false
        
        //TableView Height and Separation Setting
        self.tblServiceDetails.addObserver(self, forKeyPath: "contentSize", options: NSKeyValueObservingOptions.new, context: nil)
        tblServiceDetails.rowHeight = UITableView.automaticDimension
        tblServiceDetails.estimatedRowHeight = 40
        tblServiceDetails.separatorStyle = .none
    }
    
    //MARK: - TableView Height Settings
    override func viewDidLayoutSubviews() {
        self.resizeTableview()
    }
    
    func resizeTableview(){
        self.tblServiceDetailsHeight.constant = self.tblServiceDetails.contentSize.height
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        self.tblServiceDetails.layer.removeAllAnimations()
        self.tblServiceDetailsHeight.constant = self.tblServiceDetails.contentSize.height
        UIView.animate(withDuration: 0.5) {
            self.tblServiceDetails.updateConstraints()
            self.tblServiceDetails.layoutIfNeeded()
        }
    }
    
    deinit{
        self.tblServiceDetails.removeObserver(self, forKeyPath: "contentSize")
    }
    
    //MARK: - Button Taps
    
    // Back Button Action
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // Get A Quote Button Action
    @IBAction func btnGetAQuoteTapped(_ sender: UIButton) {
        Helper.showAlert(message: "Get A Quote Tapped")
    }
    
}

//MARK: - Service Details Table View
extension ServiceDetailsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bulletsTextArray.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "tblServiceDetailsDescriptionCell") as! tblServiceDetailsDescriptionCell
            cell.selectionStyle = .none
            cell.lblDescription.text = "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of"
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "tblServiceDetailsBulletsCell") as! tblServiceDetailsBulletsCell
            cell.selectionStyle = .none
            cell.lblBullet.text = bulletsTextArray[indexPath.row - 1]
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return UITableView.automaticDimension
        } else {
            return 40.0
        }
    }
    
}
