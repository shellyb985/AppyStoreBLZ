//
//  ImageDownloader.swift
//  AppyStoreBLZ
//
//  Created by BridgeIt on 03/08/16.
//  Copyright © 2016 bridgelabz. All rights reserved.
//

import UIKit

class ImageDownloader: NSOperation {
    var imageUrl : String
    
    init(imageUrl : String) {
        self.imageUrl = imageUrl
    }
    
    override func main() {
        var imageData = NSData(contentsOfURL: NSURL(string: imageUrl)!)
        
    }
}
