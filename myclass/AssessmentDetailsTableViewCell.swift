//
//  AssessmentDetailsTableViewCell.swift
//  myclass
//
//  Created by Harpreet Singh on 21/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import UIKit

class AssessmentDetailsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var studentID: UILabel!
    
   // @IBOutlet weak var studentMarks: UIPickerView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
