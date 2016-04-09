//
//  ViewController.swift
//  Alarm
//
//  Created by Vanessa Ng on 8/4/16.
//  Copyright © 2016 Vanessa Ng. All rights reserved.
//

import UIKit

import SpriteKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var notificationSwitch: UISwitch!
    @IBOutlet weak var dateLabel: UILabel!
    
    let localNotification = UILocalNotification()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        datePicker.addTarget(self, action: #selector(ViewController.datePickerChanged(_:)), forControlEvents: UIControlEvents.ValueChanged)
        setAlarm.backgroundColor = UIColor(red: 255/255, green: 171/255, blue: 0/255, alpha: 1)
        cancelAlarm.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func datePickerChanged(datePicker:UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateFormat = "HH:mm"
        
        let strDate = dateFormatter.stringFromDate(datePicker.date)
        dateLabel.text = strDate
    }
    
    @IBOutlet weak var setAlarm: UIButton!
    
    @IBOutlet weak var cancelAlarm: UIButton!
    
    
    //Actions

    @IBAction func setAlarm(sender: UIButton!) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeZone = NSTimeZone.defaultTimeZone()
        dateFormatter.dateFormat = "HH:mm"
        scheduleLocalNotificationWDate(datePicker.date)
        presentMessage("Alarm set. Good night!")
        //add link to GOOD NIGHT board here
    }
    
    @IBAction func cancelAlarm(sender: UIButton!) {
        UIApplication .sharedApplication().cancelAllLocalNotifications()
        presentMessage("Alarm cancelled.")
    }
    
    func snoozeAlarm() {
        let date = NSDate().dateByAddingTimeInterval(0.1 * 60)
        scheduleLocalNotificationWDate(date)
    }
    
    func scheduleLocalNotificationWDate(fireDate: NSDate) {
        let notification = UILocalNotification()
        notification.fireDate = fireDate
        notification.alertBody = "Good morning! Ready to wake up?"
        notification.soundName = "sweet_sound.mp3"
        notification.category = "FIRST_CATEGORY"
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    
    func presentMessage(mes: String) {
        let alert = UIAlertController(title: "Alarm Clock", message: mes, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default) { _ in
            // Put here any code that you would like to execute when
            // the user taps that OK button (may be empty in your case if that's just
            // an informative alert)
        }
        alert.addAction(action)
        self.presentViewController(alert, animated: true){}
    }
}

