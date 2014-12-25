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


