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

func getCurrShifts(user_id: String){
    
    var query = PFQuery(className: "Shifts")
    query.whereKey("user_id", equalTo: user_id)
    query.findObjectsInBackgroundWithBlock{
        (objects: [AnyObject]!, error: NSError!) -> Void in
        NSLog("%@", objects)
    }
    
    
}