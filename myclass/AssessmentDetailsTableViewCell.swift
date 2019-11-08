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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        studentID.text=""
        studentMarks.selectRow(0, inComponent: 0, animated: false)
    }
    
    

}
