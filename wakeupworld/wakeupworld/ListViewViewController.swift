//
//  ListViewViewController.swift
//  wakeupworld
//
//  Created by Ken Chen on 4/9/16.
//  Copyright © 2016 wakeup. All rights reserved.
//

import UIKit
import SwiftyJSON

class ListViewViewController: UITableViewController {
    
    var numberOfRows = 0
    var photoArrays: [String] = [String]()
    var nameArrays: [String] = [String]()
    var storyArrays: [String] = [String]()
    var clicks = [Bool]()
    var numClicks = 0

    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        let navVC = segue.destinationViewController as! UINavigationController
//        let tableVC = navVC.viewControllers.first as! SecondViewController
//        tableVC.receivedPhotoArrays = photoArrays
//        tableVC.receivednameArrays = nameArrays
//        tableVC.receivedclicks = clicks
//        tableVC.receivedNumClicks = numClicks
//        
//    }


    override func viewDidLoad() {
        super.viewDidLoad()
        parseJSON()


        // Do any additional setup after loading the view.
    }
    
    func parseJSON() {
        let path : String = NSBundle.mainBundle().pathForResource("watsi", ofType: "json") as String!
        let jsonData = NSData(contentsOfFile: path) as NSData!
        let readableJSON = JSON(data: jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil)
        
        numberOfRows = readableJSON["profiles"].count
        
        for i in 0...numberOfRows-1 {
            var name = readableJSON["profiles"][i]["name"].string as String!
            var photo = readableJSON["profiles"][i]["photo_url"].string as String!
            var story = readableJSON["profiles"][i]["header"].string as String!
            nameArrays.append(name)
            photoArrays.append(photo)
            storyArrays.append(story)
            clicks.append(false)
        }
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell!
        
        if nameArrays.count != 0 {
            var url = NSURL(string: photoArrays[indexPath.row])
            var data = NSData(contentsOfURL: url!)
            var imageHere = UIImage(data: data!)
            cell.imageView?.image = imageHere!
            cell.imageView?.transform = CGAffineTransformMakeScale(0.9, 1.1);
            if (clicks[indexPath.row]) {
                cell.backgroundColor = UIColor(hue: 0.0583, saturation: 0.4, brightness: 0.82, alpha: 1.0)
            } else {
                cell.backgroundColor = UIColor(hue: 0.5306, saturation: 0.31, brightness: 0.93, alpha: 1.0)
            }
        }
        
        return cell
    }

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell!
        
        var name = nameArrays[indexPath.row]
        var story = storyArrays[indexPath.row]
        var string = "This is " + name + "." + "\r\n"
        string += story
        
        cell!.textLabel?.text = string
        
        cell!.imageView?.image = nil
        cell!.textLabel?.textAlignment = NSTextAlignment.Center
        clicks[indexPath.row] = !clicks[indexPath.row]
        if (clicks[indexPath.row]) {
            cell!.backgroundColor = UIColor(hue: 0.0583, saturation: 0.4, brightness: 0.82, alpha: 1.0)
            numClicks += 1
        } else {
            cell!.backgroundColor = UIColor(hue: 0.5306, saturation: 0.31, brightness: 0.93, alpha: 1.0)
            numClicks -= 1
        }
        cell!.textLabel?.textColor = UIColor.blackColor()
        cell!.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        cell!.textLabel?.numberOfLines = 0
        NSLog("Patient: " + name + " Donate?: " + clicks[indexPath.row].description)
    }
    

    
//    /*
//    FILL IN METHOD FOR ACTION CALL WHEN RANDOM IS PRESSED
//    */
//    @IBAction func pressedRandom(sender: UIButton) {
//        
//    }
//    
//    /*
//    FILL IN METHOD FOR ACTION CALL WHEN GOODNIGHT IS PRESSED
//    */
//    @IBAction func pressedGoodNight(sender: UIButton) {
//        
//    }
//    
    @IBAction func cancelToListViewViewController(segue:UIStoryboardSegue) {
    }
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
//    */

}
