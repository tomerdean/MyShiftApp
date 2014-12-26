//
//  TableViewControllerManagerDay.swift
//  MyShift
//
//  Created by Peleg Aran on 12/26/14.
//  Copyright (c) 2014 TeamTop. All rights reserved.
//

import UIKit

class TableViewControllerManagerDay: UITableViewController {

    @IBOutlet weak var cell_evening: UITableViewCell!
    @IBOutlet weak var cell_morning: UITableViewCell!
    
    @IBOutlet weak var nav_title: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        nav_title.title = mapNumberToDay(managerDayOfWeek)

        managerDays[managerDayOfWeek] = 0
        var count = 0
        
        var currDate = NSDate()
        var selectedDay = nextWeekDate(currDate, managerDayOfWeek)
        // check if there are shifts on current day at morning.
        var morningData = getShiftByStatus(1, selectedDay, "morning")
        var eveningData = getShiftByStatus(1, selectedDay, "evening")
        
        if (morningData.count > 0){
            cell_morning.backgroundColor = UIColor.greenColor()
            count += 1;
        }
        if (eveningData.count > 0){
            cell_evening.backgroundColor = UIColor.greenColor()
            count += 1;
        }
        managerDays[managerDayOfWeek] = count
        
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath!) -> NSIndexPath {

        if (indexPath.row == 0){
            shiftType = "morning"
        }else if (indexPath.row == 1){
            shiftType = "evening"
        }
        
        return indexPath
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 2
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
