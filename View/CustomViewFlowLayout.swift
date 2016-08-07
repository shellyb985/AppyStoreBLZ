//
//  CustomViewFlowLayout.swift
//  AppyStoreApplication
//
//  Created by BridgeIt on 26/07/16.
//  Copyright © 2016 bridgelabz. All rights reserved.
//

import UIKit

class CustomViewFlowLayout: UICollectionViewFlowLayout {

    override init() {
        super.init()
    }
    
    init(width : CGFloat ,height : CGFloat) {
        super.init()
        setUpLayout(width,h: height)
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpLayout (w : CGFloat ,h : CGFloat) {
        minimumInteritemSpacing = 3
        minimumLineSpacing = 30
        itemSize = CGSize(width: (w-65)/4, height: (h-100)/2)
        sectionInset = UIEdgeInsetsMake(20,10,10,10)
        scrollDirection = .Vertical
        
    }

}
