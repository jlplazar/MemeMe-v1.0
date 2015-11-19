//
//  Meme.swift
//  MemeMe 1.0
//
//  Created by Jorge Plaza on 11/18/15.
//  Copyright © 2015 Jorge Plaza. All rights reserved.
//

import UIKit
import CoreData

class Meme {
    
    var topText: String?
    var bottomText: String?
    var image: UIImage!
    var memedImage: UIImage!
    
    init(topText: String, bottomText: String, image: UIImage, memedImage: UIImage) {
        self.topText = topText
        self.bottomText = bottomText
        self.image = image
        self.memedImage = memedImage
    }
    
    func save() {
        let imageData = UIImagePNGRepresentation(image)
        let memedImageData = UIImagePNGRepresentation(memedImage)
        
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.managedObjectContext
        let meme = NSEntityDescription.insertNewObjectForEntityForName("Meme", inManagedObjectContext: context) as NSManagedObject
        meme.setValue(topText, forKey: "topText")
        meme.setValue(bottomText, forKey: "bottomText")
        meme.setValue(imageData, forKey: "image")
        meme.setValue(memedImageData, forKey: "memedImage")
        do {
            try context.save()
            print("Meme saved")
        } catch {
            print("Error saving Meme")
        }
    }
    
}