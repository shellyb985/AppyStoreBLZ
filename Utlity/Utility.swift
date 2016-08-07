//
//  Utility.swift
//  AppyStoreBLZ
//
//  Created by BridgeIt on 06/08/16.
//  Copyright © 2016 bridgelabz. All rights reserved.
//

import UIKit
import ReactiveKit
import Alamofire

class Utility: NSObject {   

    //fetch image from string url
    func fetchImage(url : String) -> Operation<UIImage, NSError> {
        return Operation { observe in
            let request = Alamofire.request(.GET, NSURL(string: url)!).response { request, response, data, error in
                if data != nil {
                    observe.next(UIImage(data: data!)!)
                    observe.success()
                }
                else {
                    observe.next(UIImage(named: "Video-Icon-crop.png")!)
                    observe.success()
                }
            }
            return BlockDisposable {
                //request.cancel()
            }
        }
    }
    
    func mBindTo(cell : CollectionViewCell,list : SubCategorylist) {
        list.title.bindTo(cell.VideoLabel)
        if list.image == "" {
            
        }
        else {
            let image : ObservableBuffer<UIImage>? = fetchImage(list.image).shareNext()
            if image != nil {
                image?.bindTo(cell.VideoImageView)
            }
        }
      
    }
}
