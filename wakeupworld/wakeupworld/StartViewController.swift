//
//  StartViewController.swift
//  wakeupworld
//
//  Created by Ken Chen on 4/8/16.
//  Copyright © 2016 wakeup. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var contributionAmount: UILabel!
    @IBOutlet weak var contributionAmountSlider: UISlider!
    @IBOutlet weak var contributionAmountText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "lblue.png")!)
        // Do any additional setup after loading the view, typically from a nib.
//        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "goodnight.png")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func draggedContributionSlider(sender: UISlider) {
        let currentValue = Double(sender.value)
        let truncated = truncate(currentValue, precision : 2);
        contributionAmount.text = "$ \(truncated)"
    }

    /* Begin model stuff */
    func convertMoneyInput(typed : String) {
        for chr in typed.characters {
            if (!(chr >= "0" && chr <= "9") && chr != ".") {
                let alertController = UIAlertController(title: "That's not a valid number!", message:
                    "Please enter a valid ", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
    }
    
    func truncate(number: Double, precision: Int) -> Double {
        return Double(round(pow(10.0, Double(precision)) * number)/(pow(10.0, Double(precision))))
    }
    
    
    /* End model stuff */
}

