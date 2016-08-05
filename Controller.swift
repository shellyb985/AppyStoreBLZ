//
//  Controller.swift
//  AppyStoreBLZ
//
//  Created by BridgeIt on 04/08/16.
//  Copyright © 2016 bridgelabz. All rights reserved.
//

import UIKit

class Controller: NSObject {
    
    var ApiRequesrObj : ApiRequest!
    
    override init() {
        super.init()
        ApiRequesrObj = ApiRequest()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(Controller.updateCategoryDetails(_:)), name: "ControllerCategoryUpdate", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(Controller.updateSubcategoryDetails(_:)), name: "ControllerSubCategoryUpdate", object: nil)
    }

    //method to get category list from rest api
    func mGetCategoryDetails() {
        ApiRequesrObj.mFetchCategoryList()
    }
    
    //method to get subcategory from rest api
    func mGetSubCategoryDetails() {
        ApiRequesrObj.mFetchSubCategoryList()
    }
    
    //method to update categegory list in category view model
    func updateCategoryDetails(notification : NSNotification) {
        NSNotificationCenter.defaultCenter().postNotificationName("CategoryViewModelUpdata", object: self, userInfo: notification.userInfo)
    }
    
    //method to update subcategory list in subcategory view model
    func updateSubcategoryDetails(notification : NSNotification) {
        NSNotificationCenter.defaultCenter().postNotificationName("SubCategoryViewModelUpdata", object: self, userInfo: notification.userInfo)
    }
}
