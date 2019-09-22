//
//  AssessmentDetailsTableViewCell.swift
//  myclass
//
//  Created by Harpreet Singh on 21/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import UIKit

class AssessmentDetailsTableViewCell: UITableViewCell, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    var pickArray : [String] = []
    
    @IBOutlet weak var studentID: UILabel!
    
    @IBOutlet weak var studentMarks: UIPickerView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        studentMarks?.reloadAllComponents()  // My picker
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        pickerLabel.font = UIFont(name: "Avenir Next Condensed", size: 22)
            //pickerLabel.textAlignment.rawValue = NSTextAlignment.center
        pickerLabel.text = pickArray[row]
        return pickerLabel
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }

}
