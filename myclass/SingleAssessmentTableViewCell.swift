//
//  SingleAssessmentTableViewCell.swift
//  myclass
//
//  Created by Harpreet Singh on 16/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import UIKit

class SingleAssessmentTableViewCell: UITableViewCell {
    
    //MARK: Properties
   
    @IBOutlet weak var singleAssessmentTitle: UILabel!
    
    //MARK: Properties
    @IBOutlet weak var assessmentTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
