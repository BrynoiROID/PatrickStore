//
//  ConfirmOrderItemsTVCell.swift
//  PatricksStore
//
//  Created by Admin on 22/09/21.
//

import UIKit

class ConfirmOrderItemsTVCell: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var tblItems: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        // Table Settings
        tblItems.delegate = self
        tblItems.dataSource = self
    }

}

//MARK: - Table Logic
extension ConfirmOrderItemsTVCell: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemsTVCell") as! ItemsTVCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 158.0
    }
    
}
