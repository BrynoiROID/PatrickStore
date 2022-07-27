//
//  RefreshDelegate.swift
//  PatricksStore
//
//  Created by MacBook on 21/12/21.
//

import Foundation
import UIKit

protocol RefreshDelegate: AnyObject {
    func viewControllerNeedToRefresh(_ vc: UIViewController)
}
