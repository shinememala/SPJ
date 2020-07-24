//
//  Date.swift
//  SPJExtensions
//
//  Created by Shine memala on 19/06/2020.
//  Copyright © 2020 Spectrone. All rights reserved.
//

import Foundation
import UIKit

extension Date {
    public func stringWithFormat(format: String) -> String {
        let df = DateFormatter()
        df.dateFormat = format
        return df.string(from: self)
    }
    public func addDays(days: Int) -> Date {
        if let date = Calendar.current.date(byAdding: .day, value: days, to: self) {
            return date
        }
        return self
    }
    public func subtractDays(days: Int) -> Date {
        if let date = Calendar.current.date(byAdding: .day, value: -days, to: self) {
            return date
        }
        return self
    }
    public func addYears(year: Int) -> Date {
        if let date = Calendar.current.date(byAdding: .year, value: year, to: self) {
            return date
        }
        return self
    }
    public func subtractYears(year: Int) -> Date {
        if let date = Calendar.current.date(byAdding: .year, value: -year, to: self) {
            return date
        }
        return self
    }
    public func age() -> String {
        let now = Date()
        let calendar = Calendar.current
        let ageComponents: DateComponents = calendar.dateComponents([.year], from: self, to: now)
        if let year = ageComponents.year {
            return String(describing: year)
        }
        return ""
    }
    public func startOfMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
    }
    
    public func endOfMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
    }
}
