//
//  ResultViewController.swift
//  Roshambo
//
//  Created by Shubham Tripathi on 12/07/15.
//  Copyright (c) 2015 Shubham Tripathi. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    
    var selection = ["Rock", "Paper", "Scissors"]
    
    var opponentSelected: Int?
    var userSelected: Int?
    
    var opponent: String!
    var user: String!
    
    var finalResult: String!
    
    override func viewWillAppear(animated: Bool) {
        
        if let opponentSelected = self.opponentSelected {
            opponent = selection[opponentSelected]
        }
        
        if let userSelected = self.userSelected {
            user = selection[userSelected]
        }
        
        println("User selected: \(user) and Opponent selected: \(opponent)")
        
     
        switch self.user {
        case "Rock" : finalResult = computeRock(opponent)
        case "Paper" : finalResult = computePaper(opponent)
        case "Scissors" : finalResult = computeScissors(opponent)
        default: break
        }
        
        println("Final result is \(finalResult)")
        
        self.result.text = finalResult
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func computeRock(opponent: String) -> String {
        if (opponent == "Rock") {
            resultImage.image = UIImage(named: "itsATie")
            return "It's a tie"
        } else if (opponent == "Paper") {
            resultImage.image = UIImage(named: "PaperCoversRock")
            return "Paper covers Rock. Opponent wins!"
        } else {
            resultImage.image = UIImage(named: "RockCrushesScissors")
            return "Rock cruches Sicssors. User wins!"
        }
    }
    
    func computePaper(opponent: String) -> String {
        if (opponent == "Paper") {
            resultImage.image = UIImage(named: "itsATie")
            return "It's a tie"
        } else if (opponent == "Scissors") {
            resultImage.image = UIImage(named: "ScissorsCutPapers")
            return "Scissors cuts through Paper. Opponent wins!"
        } else {
            resultImage.image = UIImage(named: "PaperCoversRock")
            return "Paper covers Rock. User wins!"
        }
    }
    
    func computeScissors(opponent: String) -> String {
        if (opponent == "Scissors") {
            resultImage.image = UIImage(named: "itsATie")
            return "It's a tie"
        } else if (opponent == "Rock") {
            resultImage.image = UIImage(named: "RockCrushesScissors")
            return "Rock cruches Sicssors. Opponent wins!"
        } else {
            resultImage.image = UIImage(named: "ScissorsCutPapers")
            return "Scissors cuts through Paper. Opponent wins!"
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! HistoryViewController
//        controller.userSelected = self.user
//        controller.opponentSelected = self.opponent
    }
    
    @IBAction func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func showHistory() {
        self.performSegueWithIdentifier("showHistory", sender: nil)
    }
}