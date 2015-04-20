//
//  TaskCell.swift
//  TaskIt
//
//  Created by Diaz Orona, Jesus A. on 4/20/15.
//  Copyright (c) 2015 JADO. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var subTaskLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
