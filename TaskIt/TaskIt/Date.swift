//
//  Date.swift
//  TaskIt
//
//  Created by Diaz Orona, Jesus A. on 4/20/15.
//  Copyright (c) 2015 JADO. All rights reserved.
//

import Foundation

class Date {
    class func from(#year:Int , month: Int, day:Int) -> NSDate {
        
        var components = NSDateComponents()
        components.year = year
        components.month = month
        components.day = day
        
        var gregorianCalendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)
        var date = gregorianCalendar?.dateFromComponents(components)
        
        return date!
        
    }
    
    class func toString (#date:NSDate)-> String {
        
        var dateStringFormater = NSDateFormatter()
        dateStringFormater.dateFormat = "yyyy-MM-dd"
        let dateString = dateStringFormater.stringFromDate(date)
        
        
        return dateString
    }
}