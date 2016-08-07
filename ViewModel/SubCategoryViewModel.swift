//
//  SubCategoryViewModel.swift
//  AppyStoreBLZ
//
//  Created by BridgeIt on 04/08/16.
//  Copyright © 2016 bridgelabz. All rights reserved.
//

import UIKit
import ReactiveKit
import ReactiveUIKit

struct SubCategorylist {
    var title : Observable<String>
    var image : String
    var duration : Observable<String>
    var downloadUrl : Observable<String>
}	

class SubCategoryViewModel: NSObject {
    
    var mControllerObj : Controller!
    var mSubcategoryDetails = [SubcategoryDetails]()
    var mSubcategoryList = [SubCategorylist]()
    var mTotalSubCategoryCount = 8    //varible to store total subCategories count
    var mListCount = 0 //varibale to store total subCategories received
    var mCategory : categorylist! // varibale to store total selected category

    init(category : categorylist) {
        super.init()
        mCategory = category
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SubCategoryViewModel.updateSubcategoryViewMode(_:)), name: "SubCategoryViewModelUpdata", object: nil)
    }
    
    //method to fetch subcategory details from controller
    func mFetchSubCategoryDetailsFromController (c_Id : Int,p_Id : Int,offSet : Int) {
            mControllerObj = Controller()
            mControllerObj.mGetSubCategoryDetails(c_Id,pId : p_Id,offSet: offSet)
    }
    
    //method to send sub category details 
    func mGetSubCategory(index : Int) -> SubCategorylist? {
        if index < mSubcategoryList.count {
            return mSubcategoryList[index]
        }
        else {
            if index%8 == 0 {
               // mFetchSubCategoryDetailsFromController(mCategory.categoryId, p_Id: mCategory.parentId, offSet: index)
            }
            //creating dummy data
            let category = SubCategorylist(title: Observable(""), image: "", duration: Observable(""), downloadUrl: Observable(""))
            mSubcategoryList.insert(category, atIndex: index)

            return mSubcategoryList[index]
        }
    }
    
    //mehtod to update subcategory list in sub category view controller
    func updateSubcategoryViewMode(notification : NSNotification) {
        let mSubCategoryDetailsList = notification.userInfo!["SubCategory"] as! [SubcategoryDetails]
        mTotalSubCategoryCount = mSubCategoryDetailsList[0].totalCount
        print(mSubCategoryDetailsList.count)

        for subcategory in mSubCategoryDetailsList {
            let category = SubCategorylist(title: Observable(subcategory.title), image: subcategory.imageUrl, duration: Observable(subcategory.duration), downloadUrl: Observable(subcategory.downloadUrl))
            mSubcategoryList.insert(category, atIndex: mListCount)
            mListCount += 1

        }
        NSNotificationCenter.defaultCenter().postNotificationName("SubCategoryViewControllerUpdate", object: self, userInfo: nil)
    }
}
