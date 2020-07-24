//
//  Bundle.swift
//  SPJExtensions
//
//  Created by Shine memala on 19/06/2020.
//  Copyright © 2020 Spectrone. All rights reserved.
//

import Foundation

extension Bundle {
    var displayName: String? {
        return object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
    }
    var releaseVersionNumber: String? {
        return self.infoDictionary?["CFBundleShortVersionString"] as? String
    }

    var buildVersionNumber: String? {
        return self.infoDictionary?["CFBundleVersion"] as? String
    }
}
public struct SPJBundle {
    public static let displayName = Bundle.main.displayName ?? ""
    public static let releaseVersionNumber = Bundle.main.releaseVersionNumber ?? ""
    public static let buildVersionNumber = Bundle.main.buildVersionNumber ?? ""

}
