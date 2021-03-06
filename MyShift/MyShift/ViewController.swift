//
//  ViewController.swift
//  MyShift
//
//  Created by Tom Dean on 12/25/14.
//  Copyright (c) 2014 TeamTop. All rights reserved.
//

import UIKit

// global variables.
var managerDayOfWeek = 0
var shiftType = ""
var user_id = ""
var managerDays = [1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0, 7: 0]


class ViewController: UIViewController {
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var lblError: UILabel!
    
    @IBAction func logIn(sender: AnyObject) {
        if(txtUsername.text == "admin" || txtUsername.text == "ADMIN" || txtUsername.text == "Admin")
        {
            let managerVC = self.storyboard?.instantiateViewControllerWithIdentifier("sbManager") as ViewControllerManager
            
            self.presentViewController(managerVC, animated: true, completion: nil)
        }
        else {
        
            
            user_id = getUserIdByName(txtUsername.text)
            if(user_id != "") {
                let employeeVC = self.storyboard?.instantiateViewControllerWithIdentifier("sbEmployee") as ViewControllerEmployee
                
                self.presentViewController(employeeVC, animated: true, completion: nil)
            }
            else {
                lblError.text = "User not Found!"
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadParse()
        
        //var x = getShiftsForManager(date, "morning")
        
        
        //insertShift("qxVIS4YcNY", date, "morning")
        
        
        
        /*
        let date = NSDate()
        var x = resetDateTime(date)
        
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitMonth | .CalendarUnitYear | .CalendarUnitDay | .CalendarUnitWeekday, fromDate: date)
        
        insertShift("6", date, "sss")

        

        println("manager choose: \(managerDayOfWeek + 1)")
        
        //var r = getShiftsForManager(x, "morning")
        //println(r)
        
        
        
        
        loadParse()
/*
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitMonth | .CalendarUnitYear | .CalendarUnitDay | .CalendarUnitWeekday, fromDate: date)
        let hour = components.hour
        let minutes = components.minute
        let month = components.month
        let year = components.year
        let day = components.day
        let myWeekday = components.weekday
        
        let dateStyler = NSDateFormatter()
        dateStyler.dateFormat = "yyyy-MM-dd"
        
        let myDate = dateStyler.dateFromString(components)!
        
        let myWeekday = NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitWeekday, fromDate: myDate).weekday*/

        
        
        */
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backgroundTap(sender: UIControl) {
        txtUsername.resignFirstResponder()
    }
}
