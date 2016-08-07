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
    var categoryId : Int
    var parentId : Int
    var totalCount : Int
    
    init(categoryName : String , image : String,categoryId : Int,parentId : Int,totalCount : Int) {
        self.categoryName = categoryName 
        self.image = image
        self.categoryId = categoryId
        self.parentId = parentId
        self.totalCount = totalCount
    }
}

class SubcategoryDetails {
    var title : String
    var imageUrl : String
    var duration : String
    var downloadUrl : String
    var totalCount : Int
    
    init(title:String,imageUrl:String,duration:String,downloadUrl:String,totalCount : Int){
        self.title = title
        self.imageUrl = imageUrl
        self.duration = duration
        self.downloadUrl = downloadUrl
        self.totalCount = totalCount
    }
}
    