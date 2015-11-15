//
//  EventsTableViewCell.swift
//  meetUp
//
//  Created by Wayne Chi on 11/14/15.
//  Copyright © 2015 Wayne. All rights reserved.
//

import UIKit



class EventsTableViewCell: UITableViewCell {

    @IBOutlet var Name: UILabel!;
    @IBOutlet var Description: UILabel!
    @IBOutlet var Location: UILabel!
    @IBOutlet var DateTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
