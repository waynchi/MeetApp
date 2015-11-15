//
//  Event.swift
//  meetUp
//
//  Created by Wayne Chi on 11/14/15.
//  Copyright © 2015 Wayne. All rights reserved.
//

import Foundation

class event {
    
    var name : String;
    var date : NSDate;
    var dateString : String;
    var timeString : String;
    var location : String;
    var numPeople : Int;
    var description : String;
    
    init() {
        name = "name";
        date = NSDate();
        dateString = "Today";
        timeString = "00:00:00";
        location = "location";
        numPeople = 1;
        description = "info";
    }
}