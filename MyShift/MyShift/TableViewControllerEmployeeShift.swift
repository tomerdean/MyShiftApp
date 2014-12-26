//
//  TableViewControllerEmployeeShift.swift
//  MyShift
//
//  Created by omri on 12/26/14.
//  Copyright (c) 2014 TeamTop. All rights reserved.
//

import UIKit

class TableViewControllerEmployeeShift: UITableViewController {
    
    
    @IBOutlet weak var sundayMorning: UIImageView!
    @IBOutlet weak var sundayEvening: UIImageView!
    
    
    @IBOutlet weak var mondayMorning: UIImageView!
    @IBOutlet weak var mondayEvening: UIImageView!
    
    
    @IBOutlet weak var tuesdayMorning: UIImageView!
    @IBOutlet weak var tuesdayEvening: UIImageView!
    
    
    @IBOutlet weak var wedMorning: UIImageView!
    
    @IBOutlet weak var wedEvening: UIImageView!
    
    
    @IBOutlet weak var thursdayMorning: UIImageView!
    @IBOutlet weak var thursdayEvening: UIImageView!
    
    
    @IBOutlet weak var fridayMorning: UIImageView!
    
    @IBOutlet weak var fridaySaturday: UIImageView!
    
    @IBOutlet weak var satMorning: UIImageView!
    @IBOutlet weak var satEvening: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hide all
      /*  sundayMorn.hidden = true
        sundayEvening.hidden = true
        mondayMorning.hidden = true
        mondayEvening.hidden = true
        tuesdayMorning.hidden = true
        tuesdayEvening.hidden = true
        wedMorning.hidden = true
        wedEvening.hidden = true
        thursdayMorning.hidden = true
        thursdayEvening.hidden = true
        fridayMorning.hidden = true
        fridaySaturday.hidden = true
        satMorning.hidden = true
        satEvening.hidden = true*/
        
        var result = getCurrShifts(user_id)
        
        for var i = 0; i < result.count; i++ {
            
            var dayNumber = getDayFromDate(result[i]["shift_date"] as NSDate)
            
            dayNumber = dayNumber - 1
            // evening shift
            if(result[i]["shift_time"] as NSString == "evening") {
                
                
                switch dayNumber {
                // sunday
                case 1:
                    sundayEvening.hidden = false
                case 2:
                    mondayEvening.hidden = false
                case 3:
                    tuesdayEvening.hidden = false
                case 4:
                    wedEvening.hidden = false
                case 5:
                    thursdayEvening.hidden = false
                case 6:
                    fridaySaturday.hidden = false
                case 7:
                    satEvening.hidden = false
                default:
                    satEvening.hidden = false
                }
            }
            else {
                
                switch dayNumber {
                    // sunday
                case 1:
                    sundayMorning.hidden = false
                case 2:
                    mondayMorning.hidden = false
                case 3:
                    tuesdayMorning.hidden = false
                case 4:
                    wedMorning.hidden = false
                case 5:
                    thursdayMorning.hidden = false
                case 6:
                    fridayMorning.hidden = false
                case 7:
                    satMorning.hidden = false
                default:
                    satEvening.hidden = false
                }
            }
        }
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return 7
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
