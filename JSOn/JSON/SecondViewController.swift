//
//  SecondViewController.swift
//  JSON
//
//  Created by Casey Takeda on 4/9/16.
//  Copyright © 2016 Casey Takeda. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var thankYouNote: UIView!
    
    
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
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
