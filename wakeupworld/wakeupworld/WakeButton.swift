//
//  WakeButton.swift
//  wakeupworld
//
//  Created by Ken Chen on 4/9/16.
//  Copyright © 2016 wakeup. All rights reserved.
//

import Foundation
import UIKit

class Wakebutton: UIButton {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.layer.cornerRadius = 5.0;
        self.layer.borderColor = UIColor.redColor().CGColor
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.layer.borderWidth = 3
        self.backgroundColor = UIColor(hue: CGFloat(30), saturation: CGFloat(70), brightness: CGFloat(100), alpha: CGFloat(100))
        self.tintColor = UIColor.whiteColor()
        
    }
}