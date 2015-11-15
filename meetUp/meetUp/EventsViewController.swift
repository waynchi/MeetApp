//
//  EventsViewController.swift
//  meetUp
//
//  Created by Wayne Chi on 11/14/15.
//  Copyright © 2015 Wayne. All rights reserved.
//

import UIKit
import Parse



class EventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var events = [event]();

    override func viewDidLoad() {
        super.viewDidLoad()
        let event1 = event();
        event1.name = "Cyrus's Birthday";
        event1.dateString = "Tomorrow";
        event1.timeString = "All Day";
        event1.location = "McDonald's";
        event1.description = "Birthday party of a low-diamond scrub";
        let event2 = event();
        event2.name = "HackSC";
        event2.dateString = "Today";
        event2.timeString = "08:00";
        event2.location = "USC Annenberg";
        event2.description = "Hacking USC";
        let event3 = event();
        events.append(event1);
        events.append(event2);
        events.append(event3);
        
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Object has been saved.")
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : EventsTableViewCell = tableView.dequeueReusableCellWithIdentifier("EventsTableViewCell_ID", forIndexPath: indexPath) as! EventsTableViewCell;
        
        let index = indexPath.row;
        
        cell.Name.text = events[index].name;
        cell.Description.text = events[index].description;
        cell.DateTime.text = events[index].dateString + " " + events[index].timeString;
        cell.Location.text = events[index].location;
        
        return cell;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count;
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
