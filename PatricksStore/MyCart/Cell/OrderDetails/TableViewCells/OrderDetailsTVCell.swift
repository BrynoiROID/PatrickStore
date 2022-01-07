//
//  OrderDetailsTVCell.swift
//  PatricksStore
//
//  Created by Admin on 23/09/21.
//

import UIKit

class OrderDetailsTVCell: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var tblOrderDetailsItem: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    func initialSetup() {
        // Table Settings
        tblOrderDetailsItem.dataSource = self
        tblOrderDetailsItem.delegate = self
    }

}

//MARK: - Order Details Item Table Logic
extension OrderDetailsTVCell: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderDetailsItemTVCell") as! OrderDetailsItemTVCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170.0
    }
    
}
