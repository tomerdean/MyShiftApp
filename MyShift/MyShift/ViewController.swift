//
//  ViewController.swift
//  MyShift
//
//  Created by Tom Dean on 12/25/14.
//  Copyright (c) 2014 TeamTop. All rights reserved.
//

import UIKit

var managerDayOfWeek = 0

class ViewController: UIViewController {
    
    @IBOutlet weak var txtUsername: UITextField!
    
    @IBAction func logIn(sender: AnyObject) {
        if(txtUsername.text == "admin")
        {
            let managerVC = self.storyboard?.instantiateViewControllerWithIdentifier("sbManager") as ViewControllerManager
            
            self.presentViewController(managerVC, animated: true, completion: nil)
        }
        else {
        
            let employeeVC = self.storyboard?.instantiateViewControllerWithIdentifier("sbEmployee") as ViewControllerEmployee
            
            self.presentViewController(employeeVC, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        println("manager choose: \(managerDayOfWeek + 1)")
        
        loadParse()

        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitMonth | .CalendarUnitYear | .CalendarUnitDay, fromDate: date)
        let hour = components.hour
        let minutes = components.minute
        let month = components.month
        let year = components.year
        let day = components.day
        let www = components.weekday
        
        println("day")
        println(String(www))
        
        //insertShift("qxVIS4YcNY", date, "morning")
        //deleteShift("baYS4gZ9Ja")
        //changeShiftStatus("KFED5aZq7d", 1)
        
        
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

