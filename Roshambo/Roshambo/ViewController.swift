//
//  ViewController.swift
//  Roshambo
//
//  Created by Shubham Tripathi on 12/07/15.
//  Copyright (c) 2015 Shubham Tripathi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func randomOpponentSelection() -> Int {
            // Generate a random Int32 using arc4Random
            let randomValue = arc4random() % 3
            // Return a more convenient Int, initialized with the random value
            return Int(randomValue)
    }
    
    @IBAction func selectRock() {
        //Code
        var controller: ResultViewController
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
        
        controller.opponentSelected = randomOpponentSelection()
        controller.userSelected = 0
        
        self.presentViewController(controller, animated: true, completion: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let controller = segue.destinationViewController  as! ResultViewController
        if segue.identifier == "selectPaper" {
            controller.userSelected = 1
        } else {
            controller.userSelected = 2
        }
        controller.opponentSelected = randomOpponentSelection()
    }
    
    @IBAction func selectPaper() {
        //Code + Segue
        self.performSegueWithIdentifier("selectPaper", sender: nil)
    }
//    
//    @IBAction func selectScissor() {
//        //TODO: Segue
//    }
}