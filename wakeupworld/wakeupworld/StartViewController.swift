//
//  StartViewController.swift
//  wakeupworld
//
//  Created by Ken Chen on 4/8/16.
//  Copyright © 2016 wakeup. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var contributionAmountText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    /* End model stuff */
}

