//
//  ViewController.swift
//  JSON
//
//  Created by Casey Takeda on 4/9/16.
//  Copyright © 2016 Casey Takeda. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UITableViewController {
    
    var numberOfRows = 0
    var photoArrays: [String] = [String]()
    var nameArrays: [String] = [String]()
    var storyArrays: [String] = [String]()
    var clicks = [Bool]()
    var numClicks = 0
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let navVC = segue.destinationViewController as! UINavigationController
        let tableVC = navVC.viewControllers.first as! SecondViewController
        tableVC.receivedPhotoArrays = photoArrays
        tableVC.receivednameArrays = nameArrays
        tableVC.receivedclicks = clicks
        tableVC.receivedNumClicks = numClicks
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        parseJSON()
        tableView.separatorColor = UIColor.yellowColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var DonateButton: UIBarButtonItem!
    
    func parseJSON() {
        let path : String = NSBundle.mainBundle().pathForResource("watsi", ofType: "json") as String!
        let jsonData = NSData(contentsOfFile: path) as NSData!
        let readableJSON = JSON(data: jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil)
        
        var Name = readableJSON["profiles"][0]
        
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
            cell.imageView?.transform = CGAffineTransformMakeScale(1.2, 1.1);
            if (clicks[indexPath.row]) {
                cell.backgroundColor = UIColor.orangeColor()
            } else {
                cell.backgroundColor = UIColor.blueColor()
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
            cell!.backgroundColor = UIColor.orangeColor()
            numClicks += 1
        } else {
            cell!.backgroundColor = UIColor.blueColor()
            numClicks -= 1
        }
        cell!.textLabel?.textColor = UIColor.blackColor()
        cell!.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        cell!.textLabel?.numberOfLines = 0
        NSLog("Patient: " + name + " Donate?: " + clicks[indexPath.row].description)
    }

}

