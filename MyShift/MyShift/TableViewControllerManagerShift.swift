//
//  TableViewControllerManagerShift.swift
//  MyShift
//
//  Created by Peleg Aran on 12/26/14.
//  Copyright (c) 2014 TeamTop. All rights reserved.
//

import UIKit

class TableViewControllerManagerShift: UITableViewController {

    var items: [String] = ["Peleg"]
    var statuses = [
        ["objectid": "1989", "shiftId": 1922, "status": 0]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // init data-structure.
        statuses.removeAtIndex(0)
        items.removeAtIndex(0)
        
        // get the next sunday date.
        var currDate = NSDate()
        var selectedDay = nextWeekDate(currDate, managerDayOfWeek)
        
        var employees = getUserShiftsForManager(selectedDay, shiftType)
        
        // set user-selection-status to 0.
        for var i = 0; i < employees.count; i++
        {
            var usrStatus = getShift(employees[i].objectId,selectedDay, shiftType)
            var status = usrStatus[0]["status"] as Int
            if (status == 0){
                statuses.append(["objectid": employees[i].objectId, "shiftId": usrStatus[0].objectId, "status": 0])
            }else{
                statuses.append(["objectid": employees[i].objectId, "shiftId": usrStatus[0].objectId, "status": 1])
            }
            items.append(employees[i]["name"] as NSString)
        }

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
        return items.count;
    }
    
 
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
    
        cell.textLabel?.text = self.items[indexPath.row]
        
      /*  if (statuses[indexPath.row]["status"] == 1){
            cell.backgroundColor = UIColor.greenColor()
        } */

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var selectedCell:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        /*if (statuses[indexPath.row]["status"] == 0){
            selectedCell.contentView.backgroundColor = UIColor.greenColor()
        }*/
        
        selectedCell.contentView.backgroundColor = UIColor.greenColor()
        var currShiftId = statuses[indexPath.row]["shiftId"] as NSString
        
        if (statuses[indexPath.row]["status"] == 1){
            statuses[indexPath.row]["status"] = 0
            //change status in db
            changeShiftStatus(currShiftId, 0)
        }else{
            statuses[indexPath.row]["status"] = 1
            // change status in db
            changeShiftStatus(currShiftId, 1)
        }
        
        println(statuses)
        println()

    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        if (statuses[indexPath.row]["status"] == 1){
            statuses[indexPath.row]["status"] = 0
        }else{
            statuses[indexPath.row]["status"] = 1
        }
        
        println(statuses)
        println()
    }
    
    
    


    

    
    
    

    
    

    
    


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
