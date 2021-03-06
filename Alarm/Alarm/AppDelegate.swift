//
//  AppDelegate.swift
//  Alarm
//
//  Created by Vanessa Ng on 8/4/16.
//  Copyright © 2016 Vanessa Ng. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        
         //defining which notifications we want to support
//        let mySettings:UIUserNotificationSettings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil)
//        UIApplication.sharedApplication().registerUserNotificationSettings(mySettings)
        //the above will prompt user to activate notifications
        
        let awakeAction:UIMutableUserNotificationAction = UIMutableUserNotificationAction()
        awakeAction.identifier = "Awake"
        awakeAction.title = "I'm up!"
        
        awakeAction.activationMode = UIUserNotificationActivationMode.Foreground
        awakeAction.destructive = true
        awakeAction.authenticationRequired = false
        
        let snoozeAction:UIMutableUserNotificationAction = UIMutableUserNotificationAction()
        snoozeAction.identifier = "Snooze"
        snoozeAction.title = "10 more minutes"
        
        snoozeAction.activationMode = UIUserNotificationActivationMode.Background
        snoozeAction.destructive = false
        snoozeAction.authenticationRequired = false

        
        // category
        
        let firstCategory:UIMutableUserNotificationCategory = UIMutableUserNotificationCategory()
        firstCategory.identifier = "FIRST_CATEGORY"
        
        firstCategory.setActions([awakeAction, snoozeAction], forContext: UIUserNotificationActionContext.Default)
        firstCategory.setActions([awakeAction, snoozeAction], forContext: UIUserNotificationActionContext.Minimal)
        
        // NSSet of all our categories
        let mySettings:UIUserNotificationSettings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: Set(arrayLiteral: firstCategory))
        
        UIApplication.sharedApplication().registerUserNotificationSettings(mySettings)
        
        
        // Override point for customization after application launch.
        return true
    }
    
    
    func application(application: UIApplication,
                     handleActionWithIdentifier identifier:String?,
                                                forLocalNotification notification:UILocalNotification,
                                                                     completionHandler: (() -> Void))
    {
        
        if (identifier == "Awake")
        {
            NSNotificationCenter.defaultCenter().postNotificationName("awakePressed", object: nil)
        }
        else if (identifier == "Snooze")
        {
            let vc = ViewController()
            vc.snoozeAlarm()
            NSNotificationCenter.defaultCenter().postNotificationName("snoozePressed", object: nil)
        }
        
        completionHandler()
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}

