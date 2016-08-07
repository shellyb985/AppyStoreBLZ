//
//  SearchController.swift
//  AppyStoreApplication
//
//  Created by BridgeIt on 23/07/16.
//  Copyright © 2016 bridgelabz. All rights reserved.
//

import UIKit
import ReactiveKit
import ReactiveUIKit

struct SearchCategorylist {
    var title : Observable<String>
    var image : ObservableBuffer<UIImage>
    var duration : Observable<String>
    var downloadUrl : Observable<String>
}

class SearchViewMode: NSObject {
    
    var mControllerObj : Controller!
    var mSearchList = [SearchCategorylist]()
    var mSearchCategoryList = NSMutableArray()
    var mTotalSearchCategory = 0
    var mListCount = 0
    
    override init() {
        super.init()
        mControllerObj = Controller()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SearchViewMode.updateSearchCategoryViewMode(_:)), name: "SearchCategoryViewModelUpdata", object: nil)
    }
    
    //method to fetch search category from controller
    func mFetchSearchCategoryDetailsFromController (offSet : Int) {
        mControllerObj.mGetSearchCategory("keyWord")
    }
    
    //method to give search category
    func mGetSearchCategory(index : Int) -> SearchCategorylist? {
        if index < mSearchList.count {
            return mSearchList[index]
        }
        else {
            //creating dummy data
            mSearchList[index].downloadUrl = Observable("")
            mSearchList[index].duration = Observable("")
            mSearchList[index].image = Utility().fetchImage("").shareNext()
            mSearchList[index].title = Observable("")
            return mSearchList[index]
        }
    }
    
    //method to update search
    func updateSearchCategoryViewMode(notification : NSNotification) {
        
        
        //
        NSNotificationCenter.defaultCenter().postNotificationName("SearchCategoryViewControllerUpdate", object: self, userInfo: nil)
    }

}
