//
//  StoreTableViewCell.swift
//  PatricksStore
//
//  Created by Admin on 10/09/21.
//

import UIKit

class StoreTableViewCell: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var imgStore: UIImageView!
    
    @IBOutlet weak var lblStoreName: UILabel!
    
    @IBOutlet weak var lblStoreDistance: UILabel!
    
    @IBOutlet weak var tblStoreItem: UITableView!
    
    @IBOutlet weak var ETAView: UIView!
    
    @IBOutlet weak var lblETA: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        
        // Store Image
        imgStore.layer.cornerRadius = 5.0
        
        // Set bottom shadow
        Helper.shadowSetViewBottom(view: ETAView)
        
        // Store Item Table Settings
        tblStoreItem.dataSource = self
        tblStoreItem.delegate = self
    }

}

//MARK: - Store Item Table Logic
extension StoreTableViewCell: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreItemTableViewCell") as! StoreItemTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170.0
    }
    
}
