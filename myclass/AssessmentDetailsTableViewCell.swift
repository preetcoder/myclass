//
//  AssessmentDetailsTableViewCell.swift
//  myclass
//
//  Created by Harpreet Singh on 21/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import UIKit

class AssessmentDetailsTableViewCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    var pickArray : [String] = ["Cameron","Shaffer", "Hydril"]
    
    @IBOutlet weak var studentID: UILabel!
    
    @IBOutlet weak var studentMarks: UIPickerView!
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        studentMarks?.reloadAllComponents()  // My picker
//    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        
        // Row count: rows equals array length.
        return pickArray.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        
        // Return a string from the array for this row.
        return pickArray[row]
    }

}
