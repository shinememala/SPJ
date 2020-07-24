//
//  Dictionary.swift
//  SPJExtensions
//
//  Created by Shine memala on 19/06/2020.
//  Copyright © 2020 Spectrone. All rights reserved.
//

import Foundation
import UIKit

extension NSDictionary {
    public func boolValue(_ key: String) -> Bool {
        if let value = self.value(forKey: key) {
            let string: String = String(describing: value)
            return string.toBool
        }
        return false
    }
    public func stringValue(_ key: String) -> String {
        if let value = self.value(forKey: key) as? String {
            let string: String = String(describing: value)
            return string
        }
        return ""
    }
    public func floatValue(_ key: String) -> Float {
        if let value = self.value(forKey: key) {
            let string: String = String(describing: value)
            return string.toFloat ?? 0.0
        }
        return 0.0
    }
    public func int64Value(_ key: String) -> Int64 {
        if let value = self.value(forKey: key) {
            let string: String = String(describing: value)
            return Int64(string.toInt ?? 0)
        }
        return Int64(0)
    }
    public func intValue(_ key: String) -> Int {
         if let value = self.value(forKey: key) {
             let string: String = String(describing: value)
            return string.toInt ?? 0
         }
         return 0
     }
    public func dictArray(_ key: String) -> [NSDictionary] {
        if let array: [NSDictionary] = self.value(forKey: key) as? [NSDictionary] {
            return array
        }
        return [NSDictionary]()
    }
}
