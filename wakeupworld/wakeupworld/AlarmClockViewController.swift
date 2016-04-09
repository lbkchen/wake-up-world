//
//  AlarmClockViewController.swift
//  wakeupworld
//
//  Created by Ken Chen on 4/9/16.
//  Copyright © 2016 wakeup. All rights reserved.
//

import UIKit

class AlarmClockViewController: UIViewController {
    
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var notificationSwitch: UISwitch!
    @IBOutlet weak var dateLabel: UILabel!
    
    let localNotification = UILocalNotification()

    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.addTarget(self, action: #selector(AlarmClockViewController.datePickerChanged(_:)), forControlEvents: UIControlEvents.ValueChanged)
    
        //don't load nav bar
        self.navigationController!.navigationBar.hidden = true

        // Do any additional setup after loading the view.
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
    
    
    @IBOutlet weak var alarmButton: UIButton!
    
//    @IBAction override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
//        let dateFormatter = NSDateFormatter()
//        dateFormatter.timeZone = NSTimeZone.defaultTimeZone()
//        dateFormatter.dateFormat = "HH:mm"
//        scheduleLocalNotificationWDate(datePicker.date)
//    }
    
    @IBAction func setAlarm(sender: UIButton) {
//        let dateFormatter = NSDateFormatter()
//        dateFormatter.timeZone = NSTimeZone.defaultTimeZone()
//        dateFormatter.dateFormat = "HH:mm"
//        scheduleLocalNotificationWDate(datePicker.date)
    }
//    @IBAction func setAlarm(sender: UIButton!) {
//        
////        presentMessage("Alarm set. Good night!")
//        //add link to GOOD NIGHT board here
//    }
    
    /* Don't need to modify */
    @IBAction func cancelToAlarmClockViewController(segue:UIStoryboardSegue) {
//        UIApplication .sharedApplication().cancelAllLocalNotifications()
//        presentMessage("Alarm cancelled.")
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

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "setAlarmSegue" {
            let dateFormatter = NSDateFormatter()
            dateFormatter.timeZone = NSTimeZone.defaultTimeZone()
            dateFormatter.dateFormat = "HH:mm"
            scheduleLocalNotificationWDate(datePicker.date)
        }
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
