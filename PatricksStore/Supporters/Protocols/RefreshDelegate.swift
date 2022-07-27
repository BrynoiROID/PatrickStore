//
//  RefreshDelegate.swift
//  VFECommerce
//
//  Created by Renjithnath on 13/10/21.
//

import Foundation
import UIKit

protocol RefreshDelegate: AnyObject {
    func viewControllerNeedToRefresh(_ vc: UIViewController)
}
