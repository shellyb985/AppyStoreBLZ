//
//  ApiRequest.swift
//  AppyStoreBLZ
//
//  Created by BridgeIt on 01/08/16.
//  Copyright © 2016 bridgelabz. All rights reserved.
//

import UIKit
import Alamofire

class ApiRequest: NSObject {

    let header = [
        "X_APPY_IMEI" : "353368070301951",
        "X_APPY_USERID" : "290903782",
        "X_APPY_UTYPE" : "O",
        "X_APPY_UserAgent" : "Mozilla/5.0 (Linux; Android 5.0.2; Panasonic ELUGA Switch Build/LRX22G; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/51.0.2704.81 Mobile Safari/537.36",
        "X_APPY_ANDROID_ID" : "97493b2405dcfbcf",
        "X_APPY_VERSION" : "7",
        "X_APPY_API_KEY" : "gh610rt23eqwpll",
        "X_APPY_DEVICE_WIDTH" : "1794",
        "X_APPY_DEVICE_HEIGHT" : "1080",
        "X_APPY_CAMPAIGN_ID" : "8700441600",
        ]
    
    func mFetchCategoryList() {
        Alamofire.request(.GET, "http://beta.appystore.in/appy_app/appyApi_handler.php?method=getCategoryList&content_type=videos&limit_start=0&age=1.5&incl_age=5", headers: header)
            .responseJSON { response in

                let APIresponseObj = APIResponse()
                APIresponseObj.mParseCategoryDetails(response.result.value as! [String : AnyObject])
        }
    }
    
    //method to fetch sub category list
    func mFetchSubCategoryList(c_Id : Int,p_Id : Int,offset : Int) {
      
        Alamofire.request(.GET, "http://beta.appystore.in/appy_app/appyApi_handler.php?method=getContentList&content_type=videos&limit=8&offset=\(offset)&catid=\(c_Id)&pcatid=\(p_Id)&age=1.5&incl_age=5", headers: header)
            .responseJSON { response in
                if(response.result.value != nil)
                
                {
                    let APIresponseObj = APIResponse()
                    APIresponseObj.mParseSubCategoryDetails(response.result.value as! [String : AnyObject])
                }
                else
                {
                    print("Error")
                }
        }
    }
    
    //method to fetch search details list
    func mFetchSearchDetails(keyword : String)  {
        Alamofire.request(.GET, "", headers: header)
            .responseJSON { response in
                if(response.result.value != nil)
                {
                    let APIresponseObj = APIResponse()
                    APIresponseObj.mParseSubCategoryDetails(response.result.value as! [String : AnyObject])
                }
               else
                {
                    print("Error")
                }
        }
    }
    
}
