//
//  Device.swift
//  SPJExtensions
//
//  Created by Shine memala on 19/06/2020.
//  Copyright © 2020 Spectrone. All rights reserved.
//

import Foundation
import UIKit

extension UIDevice {
    public var isSimulator: Bool {
        #if targetEnvironment(simulator)
            return true
        #else
            return false
        #endif
    }
    public var isiPad : Bool{
        return UIDevice.current.userInterfaceIdiom == .pad
    }
}

public struct SPJDevice {
    public static let isSimulator = UIDevice.current.isSimulator
    public static let isiPad = UIDevice.current.isiPad
    public static let version = UIDevice.current.systemVersion
    public static let model = UIDevice.current.model
    public static let os = UIDevice.current.systemName
    public static let width = UIScreen.main.bounds.width
    public static let height = UIScreen.main.bounds.height
}
