//
//  ViewController.swift
//  TextFieldChallenge
//
//  Created by Shubham Tripathi on 13/07/15.
//  Copyright (c) 2015 Shubham Tripathi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var toggleTextField3: UISwitch!
    
    let zipCodeDelegate = ZipCodeDelegate()
    let currencyDelegate = CurrencyDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textField1.delegate = zipCodeDelegate
        self.textField2.delegate = currencyDelegate
        self.textField3.delegate = self
        
        self.toggleTextField3.setOn(false, animated: false)
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return self.toggleTextField3.on
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }

     @IBAction func toggleTextEditor(sender: AnyObject) {
        
        if !(sender as! UISwitch).on {
            self.textField3.resignFirstResponder()
        }
    }
}