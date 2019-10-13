//
//  popupAlert.swift
//  myclass
//
//  Created by Harpreet Singh on 20/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import UIKit

class PopUpAlert{
    
    
    func popUp(titleMsg : String, popupMsg : String) -> UIAlertController{
        
        // declare an alert
        let alert = UIAlertController(title: titleMsg, message: popupMsg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
                
            }}))
        //self.present(alert, animated: true, completion: nil)
        
        return alert
        
    }
}
