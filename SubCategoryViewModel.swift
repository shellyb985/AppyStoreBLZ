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
    
    override init() {
        super.init()
        mControllerObj = Controller()
        mControllerObj.mGetSubCategoryDetails()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SubCategoryViewModel.updateSubcategoryViewMode(_:)), name: "SubCategoryViewModelUpdata", object: nil)

    }
    
    //mehtod to update subcategory list in sub category view controller
    func updateSubcategoryViewMode(notification : NSNotification) {
        
        let mSubCategoryDetailsList = notification.userInfo!["SubCategory"] as! [SubcategoryDetails]
        for subcategory in mSubCategoryDetailsList {
            mSubcategoryList.append(SubCategorylist(title: Observable(subcategory.title), image: subcategory.imageUrl, duration: Observable(subcategory.duration), downloadUrl: Observable(subcategory.downloadUrl)))
        }
        NSNotificationCenter.defaultCenter().postNotificationName("SubCategoryViewControllerUpdate", object: self, userInfo: nil)
    }

}
