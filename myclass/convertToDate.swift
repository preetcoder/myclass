//
//  convertToDate.swift
//  myclass
//
//  Created by Harpreet Singh on 17/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import Foundation

class ConvertToDate{
    
    
    func convertToDate(dateVal : String) -> Date{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-mm-yyyy" //Your date format
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00") //Current time zone
        //according to date format your date string
        guard let date = dateFormatter.date(from: dateVal ) else {
            fatalError()
        }
        
        return date
    }
    
    func getDateFromString(dateVal : String) ->Date
    {
        let format = DateFormatter()
        format.dateFormat = "dd'-'MM'-'yyyy"
        let currentDate = format.date(from: dateVal)
        return currentDate!
    }
    
    func getStringFromDate(dateVal : Date) -> String
    {
        let format = DateFormatter()
        format.dateFormat = "dd'-'MM'-'yyyy"
        let DateText = format.string(from: dateVal)
        return DateText
    }
    
}
