//
//  ListViewViewController.swift
//  wakeupworld
//
//  Created by Ken Chen on 4/9/16.
//  Copyright © 2016 wakeup. All rights reserved.
//

import UIKit

class ListViewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    FILL IN METHOD FOR ACTION CALL WHEN RANDOM IS PRESSED
    */
    @IBAction func pressedRandom(sender: UIButton) {
        
    }
    
    /*
    FILL IN METHOD FOR ACTION CALL WHEN GOODNIGHT IS PRESSED
    */
    @IBAction func pressedGoodNight(sender: UIButton) {
        
    }
    
    @IBAction func cancelToListViewViewController(segue:UIStoryboardSegue) {
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
