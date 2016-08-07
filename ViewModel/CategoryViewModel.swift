//
//  CategoryViewModel.swift
//  AppyStoreBLZ
//
//  Created by BridgeIt on 04/08/16.
//  Copyright © 2016 bridgelabz. All rights reserved.
//

import UIKit
import ReactiveKit
import ReactiveUIKit

struct categorylist {
    var name : Observable<String>
    var image : String
    var categoryId : Int
    var parentId : Int
    
}

class CategoryViewModel : NSObject {
    
    var mControllerObj : Controller!
    var mCategoryDetailsList = [CategoryDetails]()
    var mCategoryList = [categorylist]()
    var mTotalCount = 0

     override init()
     {
        super.init()
        mControllerObj = Controller()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(CategoryViewModel.updateViewModel(_:)), name: "CategoryViewModelUpdata", object: nil)
    }
    
    //mehtod to send category details
    func mGetCategoryDetails(index : Int) -> categorylist {
        return mCategoryList[index]
    }
    
    //method to fetch category list
    func mFetchCategoryDetailsFromController(start : Int,range : Int)  {
        mControllerObj.mGetCategoryDetails()
    }
    //method to update category list and update category view controller
    func updateViewModel(notification : NSNotification) {
        mCategoryDetailsList = notification.userInfo!["Category"] as! [CategoryDetails]
        mTotalCount = mCategoryDetailsList[0].totalCount
        for category in mCategoryDetailsList {
            mCategoryList.append(categorylist(name: Observable(category.categoryName), image: category.image, categoryId: category.categoryId,parentId: category.parentId))
        }
       
        NSNotificationCenter.defaultCenter().postNotificationName("CategoryViewControllerUpdate", object: self, userInfo: nil)
    }
 
}
