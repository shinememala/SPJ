//
//  View.swift
//  SPJExtensions
//
//  Created by Shine memala on 19/06/2020.
//  Copyright © 2020 Spectrone. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    public func removeAllSubviews() {
        for subView in subviews {
            subView.removeFromSuperview()
        }
    }
}
