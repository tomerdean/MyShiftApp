//
//  Entities.swift
//  MyShift
//
//  Created by Peleg Aran on 12/25/14.
//  Copyright (c) 2014 TeamTop. All rights reserved.
//

import Foundation


func loadParse(){
    Parse.setApplicationId("zoiIuFxCdS9iNpTtDQQ1hJvkVJ87bhVH86k3GEgZ", clientKey: "EBCJVh2bKgD3iKPKKW5XfCwAYGCbuOpK62MOKyQF")
}


func getCurrShifts(userId: String) -> [AnyObject]{
    
    var result: [AnyObject]
    var query = PFQuery(className: "Shifts")
    query.whereKey("user_id", equalTo: userId)
    query.whereKey("status", equalTo: 1)
    
    result = query.findObjects()
    
    return result
}

func resetDateTime(date: NSDate) -> NSDate {
    
    let dateStyler = NSDateFormatter()
    dateStyler.dateFormat = "yyyy-MM-dd"
    
    let strDate = dateStyler.stringFromDate(date)
    let resetDate = dateStyler.dateFromString(strDate)
    
    return resetDate!
}

func insertShift(userId: String, shiftDate: NSDate, shiftTime: String) -> AnyObject {

    var shift = PFObject(className: "Shifts")
    shift.setObject(userId, forKey: "user_id")
    shift.setObject(shiftDate, forKey: "shift_date")
    shift.setObject(shiftTime, forKey: "shift_time")
    shift.setObject(0, forKey: "status")

    shift.save()
    return shift.objectId
}

func getShiftsForManager(shiftDate: NSDate, shiftTime: String) -> [AnyObject] {
    var result: [AnyObject]
    var query = PFQuery(className: "Shifts")
    
    query.whereKey("shift_date", equalTo: shiftDate)
    query.whereKey("shift_time", equalTo: shiftTime)
    
    var query2 = PFQuery(className: "User")
    query2.whereKey("objectId", matchesKey: "user_id", inQuery: query)

    result = query2.findObjects()
    
    return result
}

func deleteShift(objectId: String) {
    var result: [AnyObject]
    var query = PFQuery(className: "Shifts")
    query.whereKey("objectId", equalTo: objectId)
    
    result = query.findObjects()
    result[0].delete()
}

func changeShiftStatus(shiftId: String, status: Int){
    var query = PFQuery(className: "Shifts")
    query.whereKey("objectId", equalTo: shiftId)
    var result = query.findObjects()
    result[0].setObject(status, forKey: "status")
    
    result[0].save()
}

func getDayFromDate(date: NSDate) -> Int {
    let calendar = NSCalendar.currentCalendar()
    let components = calendar.components(.CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitMonth | .CalendarUnitYear | .CalendarUnitDay | .CalendarUnitWeekday, fromDate: date)
    
    let myWeekday = components.weekday
    
    return myWeekday
}





