//
//  SourceFile.swift
//  Alarm
//
//  Created by Vanessa Ng on 9/4/16.
//  Copyright © 2016 Vanessa Ng. All rights reserved.
//

import Foundation
public extension NSDate {
    var minute: Int {
        return NSCalendar.currentCalendar().component(.Minute, fromDate: self)
    }
    var hour: Int {
        return NSCalendar.currentCalendar().component(.Hour, fromDate: self)
    }
    var day: Int {
        return NSCalendar.currentCalendar().component(.Day, fromDate: self)
    }
    var month: Int {
        return NSCalendar.currentCalendar().component(.Month, fromDate: self)
    }
    var year: Int {
        return NSCalendar.currentCalendar().component(.Year, fromDate: self)
    }
    var fireDate: NSDate {
        let today = NSDate()
        return NSCalendar.currentCalendar().dateWithEra(1,
                                                        year: today.year,
                                                        month: today.month,
                                                        day: { hour > today.hour || (hour  == today.hour
                                                            &&  minute > today.minute) ? today.day : today.day+1 }(),
                                                        hour: hour,
                                                        minute: minute,
                                                        second: 0,
                                                        nanosecond: 0
            )!
    }
}
