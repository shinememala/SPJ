//
//  String.swift
//  SPJExtensions
//
//  Created by Shine memala on 19/06/2020.
//  Copyright © 2020 Spectrone. All rights reserved.
//

import Foundation


import UIKit


extension String {
    // MARK: - Conversion
    public var toBool: Bool {return convertToBool()}
    public var toInt: Int? { return Int(self) }
    public var toInt64: Int64? { return Int64(self) ?? 0 }

    public var toFloat: Float? { return Float(self) }
    public var toDouble: Double? { return Double(self.replace(",", to: "")) }
    public var toDecimal: Decimal? { return Decimal.init(string: self) }
    public var toNSNumber: NSNumber {return convertToNumber()}

    public var toJSON: [String: Any] {return convertToJSON()}
    public var toBase64: String { return convertToBase64() }
    public var toBase64Decoded: String { return base64Decoded() }
    public var toUTF8: String {return convertToUTF8()}
    
    public var to971Format: String {return convertTo971format()}
    public var toEIDFormat: String {return convertToEmiratesIDFormat()}
    public var toCurrencyFormat: String {return convertToCurrencyFormat()}

    // MARK: - Validation
    public var isValidEmail: Bool {return checkIsValidEmail()}
    public var isValidPassword: Bool {return checkIsValidPassword()}

    public var isValidUAEMobile: Bool {return checkIsValidUAEMobileNumber()}
    public var isBlank: Bool {return checkIsBlank()}
    public var isContainsEmoji: Bool {return checkContainsEmoji()}
    public var isContainsNumberOnly: Bool {return checkContainsNumberOnly()}
    public var isWhiteSpaceOnly: Bool {return checkContainsSpacesOnly()}
    public var isValidPhoneNumber: Bool {return checkValidPhoneNumber()}
    
    public var capFirst: String { return capitaliseFirstLetter()}
        
    public var trimWhiteSpaces: String { return self.replacingOccurrences(of: " ", with: "")}

}


// MARK: - General Methods
extension String {
    
    public func replace(_ from: String, to: String) -> String {
        return (self as NSString).replacingOccurrences(of: from, with: to)
    }
    
    public func capitaliseFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    public func contains(text: String) -> Bool {
        return (self.range(of: text) != nil) ? true : false
    }
    
    public func randomString(length: Int) -> String {
        guard length > 0 else {
            return ""
        }
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString = ""
        for _ in 1...length {
            randomString.append(base.randomElement()!)
        }
        return randomString
    }
    public func convertToCurrencyFormat() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.groupingSeparator = ","
        numberFormatter.groupingSize = 3
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.decimalSeparator = "."
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 2
        return numberFormatter.string(from: self.toNSNumber)!
    }
}

// MARK: - UI

extension String {
    public func height(withWidth width: CGFloat, font: UIFont) -> CGFloat {
        let maxSize = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let actualSize = self.boundingRect(with: maxSize, options: [.usesLineFragmentOrigin], attributes: [.font: font], context: nil)
        return actualSize.height
    }
    public func width(withWidth width: CGFloat, font: UIFont) -> CGFloat {
        let maxSize = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        let actualSize = self.boundingRect(with: maxSize, options: [.usesLineFragmentOrigin], attributes: [.font: font], context: nil)
        return actualSize.height
    }
}

// MARK: - Date
extension String {
    
    public func timeIntervalToString(format: String) -> String {
        let timeinter = TimeInterval(self)
        let nwdate = Date(timeIntervalSince1970: timeinter!)
        let df = DateFormatter()
        df.dateFormat = format
        return df.string(from: nwdate)
    }
    
    public func toDateFormat(from: String, to: String) -> String {
        let df = DateFormatter()
        df.dateFormat = from
        let curentDate = df.date(from: self)
        df.dateFormat = to
        return df.string(from: curentDate!)
    }
    
    public func toDate(format: String) -> Date? {
        let df = DateFormatter()
        df.dateFormat = format
        return df.date(from: self)
    }
    
    public func getTimeinterval(format: String) -> String {
        let df = DateFormatter()
        df.dateFormat = format
        let newDate = df.date(from: self)
        let interval = newDate?.timeIntervalSince1970
        return String(format: "%f", interval!)
    }
}

// MARK: - Encoding
private extension String {
    
    func convertToUTF8() -> String {
        return addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? ""
    }
    
    func convertToBase64() -> String {
        var result: String?
        guard let data = self.data(using: .utf8) else {
            return result ?? ""
        }
        result = data.base64EncodedString(options: Data.Base64EncodingOptions.init(rawValue: 0))
        return result ?? ""
    }
    
    func base64Decoded() -> String {
        var result: String?
        guard let data = Data.init(base64Encoded: self, options: Data.Base64DecodingOptions.init(rawValue: 0)) else {
            return result ?? ""
        }
        result = String.init(data: data, encoding: .utf8)
        return result ?? ""
    }
}
// MARK: - Conversion
private extension String {
    
    func convertToNumber() -> NSNumber {
        if let myInteger = Int(self) {
            return NSNumber(value: myInteger)
        }
        if let myInteger = Double(self) {
            return NSNumber(value: myInteger)
        }
        return 0
    }
    
    func convertToJSON() -> [String: Any] {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] ?? [String: Any]()
            } catch {
                print(error.localizedDescription)
            }
        }
        return [String: Any]()
    }
    
    func convertToBool() -> Bool {
        let lowercaseSelf = self.lowercased()
        
        switch lowercaseSelf {
        case "true", "yes", "1":
            return true
        case "false", "no", "0":
            return false

        default:
            return false
        }
    }
    
    func convertTo971format() -> String {
        var stageFirst = self
        if self.hasPrefix("0") {
            stageFirst = String(self.dropFirst())
        } else if self.hasPrefix("971") {
            return  stageFirst
        }
        let phone = "+971 " + stageFirst
        
        let newString = NSMutableString(string: phone)
        if newString.length > 9 {
            newString.insert("-", at: 10)
        }
        return newString as String
    }
    func convertToEmiratesIDFormat() -> String {
        
        let new: String = self.replacingOccurrences(of: "-", with: "", options: .literal, range: nil)
        if new.count < 3 || new.count > 15 {
            return new
        }
        let newString = NSMutableString(string: new)
        if newString.length > 3 {
            newString.insert("-", at: 3)
        }
        if newString.length > 7 {
            newString.insert("-", at: 8)
        }
        if newString.length > 15 {
            newString.insert("-", at: 16)
        }
        var finalString = newString as String
        
        let lastChar = finalString[finalString.index(before: finalString.endIndex)]
        if lastChar == "-" {
            finalString.removeLast()
        }
        return finalString
    }
    
}

// MARK: - Validation
private extension String {
    func checkIsValidUAEMobileNumber() -> Bool {
        if (self.count ) == 0 {
            return false
        }
        let withCountryCode = "(9715)[0-9]{8}?"
        let predicateForCountryCode = NSPredicate(format: "(SELF MATCHES %@)", withCountryCode)
        let bWithCountryCode: Bool = predicateForCountryCode.evaluate(with: self)
        if !bWithCountryCode {
            return false
        }
        return true
    }
    
    func checkIsValidEmail() -> Bool {
        if self.count == 0 {
            return false
        }
        let emailRegex: String = "^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        let matches: Bool = emailTest.evaluate(with: self)
        return matches
    }
    func checkIsValidPassword() -> Bool {
        if self.count < 6 {
            return false
        }
        return true
    }
    func checkIsBlank() -> Bool {
        if self.isWhiteSpaceOnly == true || self.contains("<null>") {
            return true
        } else {
            return false
        }
    }
    
    func checkContainsEmoji() -> Bool {
        for scalar in unicodeScalars {
            switch scalar.value {
            case 0x1F600...0x1F64F, // Emoticons
            0x1F300...0x1F5FF, // Misc Symbols and Pictographs
            0x1F680...0x1F6FF, // Transport and Map
            0x2600...0x26FF,   // Misc symbols
            0x2700...0x27BF,   // Dingbats
            0xFE00...0xFE0F:   // Variation Selectors
                return true

            default:
                continue
            }
        }
        return false
    }
    
    func checkContainsNumberOnly() -> Bool {
        let inverseSet = NSCharacterSet(charactersIn: "0123456789").inverted
        let components = self.components(separatedBy: inverseSet)
        let filtered = components.joined(separator: "")
        return self == filtered
    }
    func checkContainsSpacesOnly() -> Bool {
        let text = self.trimWhiteSpaces
        return !(text.count > 0)
    }
   
    func checkValidPhoneNumber() -> Bool {
        let charcterSet  = NSCharacterSet(charactersIn: "+0123456789").inverted
        let inputString = self.components(separatedBy: charcterSet)
        let filtered = inputString.joined(separator: "")
        return  self == filtered
    }
}

