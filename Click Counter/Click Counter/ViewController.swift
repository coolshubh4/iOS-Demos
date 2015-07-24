//
//  ViewController.swift
//  Click Counter
//
//  Created by Shubham Tripathi on 12/07/15.
//  Copyright (c) 2015 Shubham Tripathi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0
    var label:UILabel!
    
    var toggle = true
    var colorOne = UIColor.yellowColor()
    var colorTwo = UIColor.redColor()
    
    var colorArray = [UIColor.yellowColor(), UIColor.redColor(), UIColor.purpleColor(), UIColor.orangeColor()]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.view.backgroundColor = UIColor.cyanColor()
        
        //Label
        var label = UILabel()
        label.frame = CGRectMake(100, 150, 60, 60)
        label.text = "0"
        
        self.view.addSubview(label)
        self.label = label
        
        //Increment Button
        var incrementButton = UIButton()
        incrementButton.frame = CGRectMake(100, 250, 60, 60)
        incrementButton.setTitle("Inc +", forState: .Normal)
        incrementButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        
        self.view.addSubview(incrementButton)
        incrementButton.addTarget(self, action: "incrementCount", forControlEvents: UIControlEvents.TouchUpInside)
        
        //Decrement Button
        var decrementButton = UIButton()
        decrementButton.frame = CGRectMake(100, 350, 60, 60)
        decrementButton.setTitle("Dec -", forState: .Normal)
        decrementButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        
        self.view.addSubview(decrementButton)
        decrementButton.addTarget(self, action: "decrementCount", forControlEvents: UIControlEvents.TouchUpInside)
        
        //BackgroungColorToggle Button
        var toggleColorButton = UIButton()
        toggleColorButton.frame = CGRectMake(100, 450, 150, 100)
        toggleColorButton.setTitle("ToggleBGColor", forState: .Normal)
        toggleColorButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        
        self.view.addSubview(toggleColorButton)
        toggleColorButton.addTarget(self, action: "toggleBGColor", forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
    func incrementCount() {
        self.count++
        self.label.text = "\(self.count)"
    }
    
    func decrementCount() {
        self.count--
        self.label.text = "\(self.count)"
    }
    
    func toggleBGColor () {
//        if toggle {
//            self.view.backgroundColor = colorOne
//            toggle = false
//        } else {
//            self.view.backgroundColor = colorTwo
//            toggle = true
//        }
        let randomColor = Int(arc4random_uniform(UInt32(colorArray.count)))
        print(randomColor)
        self.view.backgroundColor = colorArray[randomColor]
    }
}

