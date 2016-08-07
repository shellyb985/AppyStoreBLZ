//
//  Controller.swift
//  AppyStoreBLZ
//
//  Created by BridgeIt on 04/08/16.
//  Copyright © 2016 bridgelabz. All rights reserved.
//

import UIKit

class Controller : NSObject
{
    var ApiRequesrObj : ApiRequest!
    
    override init() {
        super.init()
        ApiRequesrObj = ApiRequest()
        //Observing category updates from rest call
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(Controller.updateCategoryDetails(_:)), name: "ControllerCategoryUpdate", object: nil)
        //Observing subcategory updates from rest call
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(Controller.updateSubcategoryDetails(_:)), name: "ControllerSubCategoryUpdate", object: nil)
        //Observing search category updates from rest call
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(Controller.updateSearchCategoryDetails(_:)), name: "ControllerSearchCategoryUpdate", object: nil)
    }

    //method to get category list from rest api
    func mGetCategoryDetails() {
        ApiRequesrObj.mFetchCategoryList()
    }
    
    //method to get subcategory from rest api
    func mGetSubCategoryDetails(cId : Int,pId : Int,offSet : Int) {
        ApiRequesrObj.mFetchSubCategoryList(cId,p_Id : pId,offset: offSet)
    }
    
    //medthod to get SearchDetails from api
    func mGetSearchCategory(keyword : String) {
        ApiRequesrObj.mFetchSearchDetails(keyword)
    }
    
    //method to update categegory list in category view model
    func updateCategoryDetails(notification : NSNotification) {
        NSNotificationCenter.defaultCenter().postNotificationName("CategoryViewModelUpdata", object: self, userInfo: notification.userInfo)
    }
    
    //method to update subcategory list in subcategory view model
    func updateSubcategoryDetails(notification : NSNotification) {
        NSNotificationCenter.defaultCenter().postNotificationName("SubCategoryViewModelUpdata", object: self, userInfo: notification.userInfo)
    }
    
    //method to update search categories list in search view model
    func updateSearchCategoryDetails(notification : NSNotification) {
        NSNotificationCenter.defaultCenter().postNotificationName("SearchCategoryViewModelUpdata", object: self, userInfo: notification.userInfo)
    }
}
