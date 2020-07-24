//
//  Numbers.swift
//  SPJExtensions
//
//  Created by Shine memala on 19/06/2020.
//  Copyright © 2020 Spectrone. All rights reserved.
//

import Foundation
import UIKit



//MARK:- Int

extension Int {
    public var toString: String { return "\(self)" }
    public var toCGFLoat: CGFloat { return CGFloat(self)}
    public var toFloat: Float { return Float(self)}
    public var toDouble: Double { return Double(self)}
   
    public var half: Int { return self / 2}
    public var square: Int { return self * self}
    public var cube: Int { return self * self * self }
    public var opposite: Int { return -self}
    public var absolute: Int { return abs(self)}
}

//MARK:- Int64

extension Int64 {
    public var toString: String { return "\(self)" }
    public var toFloat: Float { return Float(self)}
    public var toDouble: Double { return Double(self)}
    public var toInt: Int { return Int(self)}

}

//MARK:- Float

extension Float {
    public var toString: String { return "\(self)" }
    public var toCGFloat: CGFloat { return CGFloat(self)}
    public var toInt: Int { return Int(self)}
    public var toRoundedInt: Int { return Int(roundf(self))}
    public var toDouble: Double { return Double(self)}
    
    public var half: Float { return self / 2}
    public var opposite: Float { return -self}
    public var absolute: Float { return abs(self)}
}

//MARK:- Double

extension Double {
    public var toString: String { return "\(self)" }
    public var toCFfloat: CGFloat { return CGFloat(self) }
    public var toInt: Int { return Int(self) }
    public var toFloat: Float { return Float(self) }
    
    public var half: Double { return self / 2 }
    public var opposite: Double { return -self }
    public var absolute: Double { return abs(self) }
    
    public func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return Darwin.round(self * divisor) / divisor
    }
}

//MARK:- CGFloat

extension CGFloat {
    
    public func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
    
    public var toString: String { return "\(self)" }
    public var toInt: Int { return Int(self)}
    public var toFloat: Float { return Float(self)}
    public var toDouble: Double { return Double(self)}
    
    public var half: CGFloat { return self / 2}
    public var square: CGFloat { return (self * self)}
    public var cube: CGFloat { return (self * self * self)}
    public var opposite: CGFloat { return -self}
    public var absolute: CGFloat { return abs(self)}
}

//MARK:- Bool

extension Bool {
    init(fromString boolString: String) {
        self = (boolString == "1")
    }
    init(fromInt boolInt: Int) {
        self = (boolInt == 1)
    }
    
    public var int: Int { return yes ? 1 : 0 }
    public var string: String { return yes ? "1" : "0" }
    public var boolString: String { return yes ? "true" : "false" }

    public var yes: Bool { return self == true }
    public var positive: Bool { return yes }
    public var no: Bool { return self == false }
    public var negative: Bool { return no }
    public var opposite: Bool { return !self }
    
    mutating func toggle() { self = !self }

    public func toInt() -> Int { return int }
    public func toString() -> String { return string }
    public func toBoolString() -> String { return boolString }

}
