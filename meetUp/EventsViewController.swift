//
//  EventsViewController.swift
//  meetUp
//
//  Created by Wayne Chi on 11/14/15.
//  Copyright © 2015 Wayne. All rights reserved.
//

import UIKit
import Parse

protocol EventsViewControllerDelegate {
    func passEvent(eventPassed: Dictionary<String,String>) -> Void;
}

class EventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, EventsViewControllerDelegate {
    
    @IBOutlet var eventsTableView: UITableView!
    var events = [Dictionary<String,String>]();

    override func viewDidLoad() {
        super.viewDidLoad()
    
        if events.count == 0 {
            print("TEST");
        
            let query = PFQuery(className:"Event")
            query.findObjectsInBackgroundWithBlock {
                (eventArray: [PFObject]?, error: NSError?) -> Void in
                print("In Block");
                if error == nil && eventArray!.count != 0 {
                    for(var i = 0; i < eventArray!.count; i++) {
                        for(var j = 0; j < eventArray![i].allKeys().count; j++) {
                            var tempDict = Dictionary<String,String>();
                            tempDict[eventArray![i].allKeys()[j]] = eventArray![i].objectForKey(eventArray![i].allKeys()[j]) as? String;
                        }
                    }
                }
                else {
                    print(error);
                }
                self.eventsTableView.reloadData();
            }
        }
    
        /*var event1 = Dictionary<String,String>();
        event1["name"] = "Cyrus's Birthday";
        event1["dateString"] = "Tomorrow";
        event1["timeString"] = "All Day";
        event1["location"] = "McDonald's";
        event1["description"] = "Birthday party of a low-diamond scrub";
        passEvent(event1);
        var event2 = Dictionary<String,String>();
        event2["name"] = "HackSC";
        event2["dateString"] = "Today";
        event2["timeString"] = "08:00";
        event2["location"] = "USC Annenberg";
        event2["description"] = "Hacking USC";
        passEvent(event2);
        events.append(event1);
        events.append(event2);*/
        
        /*let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Object has been saved.")
        }*/

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
        
        cell.Name.text = events[index]["name"];
        cell.Description.text = events[index]["description"];
        if let dateString = events[index]["dateString"] {
            if let timeString = events[index]["timeString"] {
                cell.DateTime.text = dateString + " " + timeString;
            }
            else {
                cell.DateTime.text = dateString;
            }
        }
        else {
            cell.DateTime.text = " ";
        }
        
        cell.Location.text = events[index]["location"];
        
        return cell;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count;
    }
    
    func passEvent(eventPassed: Dictionary<String,String>) -> Void {
        let event = PFObject(className: "Event");
        event["event"] = eventPassed;
        event.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Object has been saved.")
        }
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
