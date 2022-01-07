//
//  tblShopDetailsProductSearchCell.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 29/09/21.
//

import UIKit

class tblShopDetailsProductSearchCell: UITableViewCell,UISearchBarDelegate {

    //MARK: - IB Outlets
    @IBOutlet weak var searchBarSeller: UISearchBar!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: -  Search Bar Handling
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if UIApplication.shared.isKeyboardPresented {
            self.endEditing(true)
        }
    }
}
