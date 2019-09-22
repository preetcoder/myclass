//
//  FileSaving.swift
//  myclass
//
//  Created by Harpreet Singh on 22/9/19.
//  Copyright © 2019 Harpreetandbhavesh. All rights reserved.
//

import Foundation
import UIKit

class FileSaving {
    
    public static func saveImage(image: UIImage) -> String {
        
        let imageData = NSData(data: image.pngData()!)
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,  FileManager.SearchPathDomainMask.userDomainMask, true)
        let docs = paths[0] as NSString
        let uuid = NSUUID().uuidString + ".png"
        let fullPath = docs.appendingPathComponent(uuid)
        _ = imageData.write(toFile: fullPath, atomically: true)
        return uuid
        
    }
    
    static func getImage(imageName: String) -> UIImage? {
        
        var savedImage: UIImage?
        
        if let imagePath = getFilePath(fileName: imageName) {
            savedImage = UIImage(contentsOfFile: imagePath)
        }
        else {
            savedImage = nil
        }
        
        return savedImage
        
    }
    
    static func getFilePath(fileName: String) -> String? {
        
        let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
        let nsUserDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        var filePath: String?
        let paths = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
        if paths.count > 0 {
            let dirPath = paths[0] as NSString
            filePath = dirPath.appendingPathComponent(fileName)
        }
        else {
            filePath = nil
        }
        
        return filePath
    }
    
    static func createFile() {
//        let fileName = "Test"
//        let documentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
//        let fileURL = documentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
//        print("File PAth: \(fileURL.path)")
        
        
    }
    
    static func createNewDirPath(){
        
       
    }
}
