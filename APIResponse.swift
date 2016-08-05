//
//  APIResponse.swift
//  AppyStoreBLZ
//
//  Created by BridgeIt on 01/08/16.
//  Copyright © 2016 bridgelabz. All rights reserved.
//

import UIKit

class APIResponse: NSObject {


    override init() {
        super.init()
        
    }
    
    //method to parse category list
    func mParseCategoryDetails(response : [String : AnyObject]) {     //response : [String : AnyObject]
    
        var categortList = [CategoryDetails]()
        let count = response["Responsedetails"]!["category_count"] as! Int
        for i in 0..<count {
            
            let name = response["Responsedetails"]!["category_id_array"]!![i]["category_name"] as! String
            let image = response["Responsedetails"]!["category_id_array"]!![i]["image_path"]!!["50x50"] as! String
            let cId = response["Responsedetails"]!["category_id_array"]!![i]["category_id"] as! String
            let pId = response["Responsedetails"]!["category_id_array"]!![i]["parent_category_id"] as! String
 
            categortList.append(CategoryDetails(categoryName: name, image: image, categoryId: cId, parentId: pId))
        }
        NSNotificationCenter.defaultCenter().postNotificationName("ControllerCategoryUpdate", object: self, userInfo: ["Category" : categortList])
    }
    
    //method to parse subcategory list
    func mParseSubCategoryDetails(response : [String : AnyObject]) {
        var subcategoryList = [SubcategoryDetails]()
        let count = response["Responsedetails"]!["data_array"]!!.count as Int
        for i in 0..<count {

            let name = response["Responsedetails"]!["data_array"]!![i]["title"] as! String
            let image = response["Responsedetails"]!["data_array"]!![i]["image_path"] as! String
            let duration = response["Responsedetails"]!["data_array"]!![i]["content_duration"] as! String
            let downloadUrl = response["Responsedetails"]!["data_array"]!![i]["dnld_url"] as! String
            
            subcategoryList.append(SubcategoryDetails(title: name, imageUrl: image, duration: duration, downloadUrl: downloadUrl))
        }
        NSNotificationCenter.defaultCenter().postNotificationName("ControllerSubCategoryUpdate", object: self, userInfo: ["SubCategory" : subcategoryList])
    }
}
