//
//  MenuTableViewCell.swift
//  PatricksStore
//
//  Created by Admin on 06/09/21.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var menuImage: UIImageView!
    
    @IBOutlet weak var menuLabel: UILabel!
    
    @IBOutlet weak var arrowImage: UIImageView!
    
    @IBOutlet weak var separatorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }

    //MARK: - Initial Setup
    func initialSetup() {
        // Makes the separator view dotted
        drawDottedLine(start: CGPoint(x: separatorView.bounds.minX, y: separatorView.bounds.minY), end: CGPoint(x: separatorView.bounds.maxX, y: separatorView.bounds.minY), view: separatorView)
    }

}
