//
//  ViewController.swift
//  Calculator
//
//  Created by Shubham Tripathi on 06/07/15.
//  Copyright (c) 2015 Shubham Tripathi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var isThisFirstDigit: Bool = false
    
    var brain = CalculatorBrain()
    
    @IBAction func appendDigit(sender: UIButton) {
        
        let digit = sender.currentTitle!
        //println(digit)
        if isThisFirstDigit {
            display.text! = display.text! + digit
        } else {
            display.text! = digit
            isThisFirstDigit = true
        }
    }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            isThisFirstDigit = false
        }
    }
    
    @IBAction func enterKey() {
        isThisFirstDigit = false
        if let result = brain.pushOperand(displayValue) {
            displayValue = result
        } else {
            displayValue = 0
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        if isThisFirstDigit {
            enterKey()
        }
        if let operation = sender.currentTitle {
            println(operation)
            if let result = brain.performOperation(operation) {
                displayValue = result
            } else {
                displayValue = 0
            }
        }
    }
    
    @IBAction func deleteKey() {
        if brain.resetOpStack() {
            displayValue = 0
            isThisFirstDigit = false
        }
    }
    
    @IBAction func backSpace() {
        displayValue = displayValue - (displayValue % 10)
    }
    
    
}