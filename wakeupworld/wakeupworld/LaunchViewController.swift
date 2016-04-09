//
//  LaunchViewController.swift
//  wakeupworld
//
//  Created by Ken Chen on 4/9/16.
//  Copyright © 2016 wakeup. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

    @IBOutlet weak var launchAnimation: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        launchAnimation.animationImages = [
            UIImage(named: "launchscreen-1.png")!,
            UIImage(named: "launchscreen-2.png")!,
            UIImage(named: "launchscreen-3.png")!,
            UIImage(named: "launchscreen-4.png")!
        ]
        launchAnimation.animationDuration = 2
        launchAnimation.startAnimating()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
