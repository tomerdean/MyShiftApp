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

func insertShift(userId: String, shiftDate: NSDate, shiftTime: String) {
    var shift = PFObject(className: "Shifts")
    shift.setObject(userId, forKey: "user_id")
    shift.setObject(shiftDate, forKey: "shift_date")
    shift.setObject(shiftTime, forKey: "shift_time")
    shift.setObject(0, forKey: "status")

    shift.save()
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

func mapNumberToDay(dayNumber: Int) -> String {
    
    var returnDay: String
    
    switch dayNumber {
    case 1:
        returnDay = "Sunday"
    case 2:
        returnDay = "Monday"
    case 3:
        returnDay = "Tuesday"
    case 4:
        returnDay = "Wednesday"
    case 5:
        returnDay = "Thursday"
    case 6:
        returnDay = "Friday"
    case 7:
        returnDay = "Saturday"
    default:
        returnDay = ""
    }
    
    return returnDay
}





