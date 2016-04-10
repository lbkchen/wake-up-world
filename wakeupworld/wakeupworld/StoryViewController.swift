//
//  StoryViewController.swift
//  wakeupworld
//
//  Created by Ken Chen on 4/9/16.
//  Copyright © 2016 wakeup. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController {

    
    // Photo and Text Message
    @IBOutlet weak var thankYou: UITextView!
    @IBOutlet weak var thankYouPhotoPerson: UIImageView!
    
    var receivedPhotoArrays: [String] = [String]()
    var receivednameArrays: [String] = [String]()
    var receivedclicks: [Bool] = [Bool]()
    
    var receivedNumClicks = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var number = receivednameArrays.count - 1
        var intRandom = -1
        if receivedNumClicks <= 0 {
            return
        }
        while true {
            var upper: UInt32 = UInt32(number)
            var random = arc4random_uniform(upper)
            intRandom = Int(random)
            if receivedclicks[intRandom] {
                break
            }
        }
        
        var url = NSURL(string: receivedPhotoArrays[intRandom])
        var data = NSData(contentsOfURL: url!)
        var imageHere = UIImage(data: data!)
        
        thankYouPhotoPerson.image = imageHere!

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
