//
//  String+Validation.swift
//  Offer
//
//  Created by Gabriel Dragoni on 30/12/20.
//

import Foundation

extension String {
    func isEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func isValidCPF() -> Bool {
        guard digits.count == 11 else {
            return false
        }
        guard !digits.allCharactersAreEqual() else {
            return false
        }
        
        var firstCheckAccumulator = 0, lastCheckAccumulator = 0
        for i in 0...8 {
            let digit = Int(digits.charAt(index: i))
            firstCheckAccumulator += digit! * (10 - i)
            lastCheckAccumulator += digit! * (11 - i)
        }
        
        let firstCheckRemainder = firstCheckAccumulator % 11
        let firstCheckDigit = firstCheckRemainder < 2 ? 0 : 11 - firstCheckRemainder
        
        lastCheckAccumulator += firstCheckDigit * 2
        let lastCheckRemainder = lastCheckAccumulator % 11
        let lastCheckDigit = lastCheckRemainder < 2 ? 0 : 11 - lastCheckRemainder
        
        let originalFirstCheckDigit = Int(digits.charAt(index: 9))
        let originalLastCheckDigit = Int(digits.charAt(index: 10))
        return originalFirstCheckDigit == firstCheckDigit && originalLastCheckDigit == lastCheckDigit
    }
    
    var digits: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
    
    var alphanumerics: String {
        return components(separatedBy: CharacterSet.alphanumerics.inverted).joined()
    }
    
    func allCharactersAreEqual() -> Bool {
        return sorted().first == sorted().last
    }
    
    func charAt(index: Int) -> String {
        if self.count <= index {
            return ""
        }
        else if index >= 0 {
            let char = self[self.index(startIndex, offsetBy: index)]
            return String(char)
        }
        return ""
    }
    
    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
    
    var isOnlyLetters: Bool {
        return !isEmpty && range(of: "[^a-zA-Z]", options: .regularExpression) == nil
    }
    
    var isOnlyNumbers: Bool {
        return !isEmpty && range(of: "[^0-9]", options: .regularExpression) == nil
    }
    
    func matches(regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
}
