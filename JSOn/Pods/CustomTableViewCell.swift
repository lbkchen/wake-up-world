//
//  CustomTableViewCell.swift
//  Pods
//
//  Created by Casey Takeda on 4/9/16.
//
//

import UIKit
class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageTEst: UIImageView!
    
    override func awakeFromNib() {
         super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        var cell:CustomTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("CustomTableViewCell") as! CustomTableViewCell
    
    cell.imageTEst.image = UIImage(named:self.arrImageName[indexPath.row])
    
    return cell
}
