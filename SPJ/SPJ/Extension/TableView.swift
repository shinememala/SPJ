//
//  TableView.swift
//  SPJExtensions
//
//  Created by Shine memala on 19/06/2020.
//  Copyright © 2020 Spectrone. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    public func reload(status: @escaping BoolBlock ) {
        UIView.animate(withDuration: 1.0, animations: {
            self.reloadData()
        }) { (_) in
            status(true)
        }
    }
}
