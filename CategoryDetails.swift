//
//  CategoryDetails.swift
//  AppyStoreBLZ
//
//  Created by BridgeIt on 01/08/16.
//  Copyright © 2016 bridgelabz. All rights reserved.
//

import UIKit
import ReactiveKit
import ReactiveUIKit

class CategoryDetails {

    var categoryName : String
    var image : String
    var categoryId : String
    var parentId : String
    
    
    init(categoryName : String , image : String,categoryId : String,parentId : String) {
        self.categoryName = categoryName 
        self.image = image
        self.categoryId = categoryId
        self.parentId = parentId
    }
}

class SubcategoryDetails {
    var title : String
    var imageUrl : String
    var duration : String
    var downloadUrl : String
    
    init(title:String,imageUrl:String,duration:String,downloadUrl:String){
        self.title = title
        self.imageUrl = imageUrl
        self.duration = duration
        self.downloadUrl = downloadUrl
    }
}
    