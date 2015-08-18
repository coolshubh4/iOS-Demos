//
//  CurrencyDelegate.swift
//  TextFieldChallenge
//
//  Created by Shubham Tripathi on 19/07/15.
//  Copyright (c) 2015 Shubham Tripathi. All rights reserved.
//

import Foundation
import UIKit

class CurrencyDelegate: NSObject, UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        var oldText = textField.text as NSString; println("oldText: \(oldText)");
        var newText = oldText.stringByReplacingCharactersInRange(range, withString: string); println("newText: \(newText)");
        var newTextString = String(newText); println("newTextString: \(newTextString)");
        
        let digits = NSCharacterSet.decimalDigitCharacterSet(); println("digits: \(digits)");
        var digitText = ""
        
        for c in newTextString.unicodeScalars {
            if digits.longCharacterIsMember(c.value) {
                digitText.append(c)
            }
        }
        println("digitText: \(digitText)")
        
        // Format the new string
        if let numOfPennies = digitText.toInt() {
            newText = "$" + self.dollarStringFromInt(numOfPennies) + "." + self.centsStringFromInt(numOfPennies)
        } else {
            newText = "$0.00"
        }
        
        textField.text = newText
        
        return false
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField.text.isEmpty {
            textField.text = "$0.00"
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true;
    }
    
    func dollarStringFromInt(value: Int) -> String {
        return String(value / 100)
    }
    
    func centsStringFromInt(value: Int) -> String {
        let cents = value % 100
        var centsString = String(cents)
        
        if cents < 10 {
            centsString = "0" + centsString
        }
        
        return centsString
    }
}