//
//  AssessmentDetailsTableViewCell.swift
//  myclass
//
//  Created by Harpreet Singh on 21/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import UIKit

class AssessmentDetailsTableViewCell: UITableViewCell
{
    var pickArray : [String] = []
    
    @IBOutlet weak var studentID: UILabel!
    
    @IBOutlet weak var studentMarks: UIPickerView!
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        studentMarks?.reloadAllComponents()  // My picker
//    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }
    
    

}
