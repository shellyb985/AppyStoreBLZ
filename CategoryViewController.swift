//
//  CategoryViewController.swift
//  AppyStoreBLZ
//
//  Created by BridgeIt on 04/08/16.
//  Copyright © 2016 bridgelabz. All rights reserved.
//

import UIKit
import ReactiveKit
import ReactiveUIKit
import Alamofire
import AlamofireImage


class CategoryViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    @IBOutlet weak var mHomeButton: UIButton!
    
    @IBOutlet weak var mVideoButton: UIButton!
    
    @IBOutlet weak var mHistoryButton: UIButton!
    
    @IBOutlet weak var mSearchButton: UIButton!

    @IBOutlet weak var mCartButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var mCategoryViewModelObj : CategoryViewModel!
    var queue = NSOperationQueue()
    
    override func viewDidLoad() {
        mChangeButtonImage()
        collectionView.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundimage")!)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundimage")!)

        
        collectionView.registerNib(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        super.viewDidLoad()
        collectionView.collectionViewLayout = CustomViewFlowLayout(width : CGRectGetWidth(self.view.frame) , height : CGRectGetHeight(self.view.frame))
        mCategoryViewModelObj = CategoryViewModel()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(CategoryViewController.updateViewController(_:)), name: "CategoryViewControllerUpdate", object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mCategoryViewModelObj.mCategoryList.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as! CollectionViewCell
        
        
        mCategoryViewModelObj.mCategoryList[indexPath.row].name.bindTo(cell.VideoLabel)
        
        Alamofire.request(.GET, mCategoryViewModelObj.mCategoryList[indexPath.row].image)
            .responseImage { response in
                if let image = response.result.value {
                    cell.VideoImageView.image = image
                }
        }
        
        
        return cell
    }
    
   
    func updateViewController(notification : NSNotification) {
        collectionView.reloadData()
    }
    
    func mChangeButtonImage() {
        mHomeButton.setImage(UIImage(named: "ladyimage"), forState: UIControlState.Normal)
        mVideoButton.setImage(UIImage(named: "videoimage"), forState: UIControlState.Normal)
        mHistoryButton.setImage(UIImage(named: "historyimage"), forState: UIControlState.Normal)
        mSearchButton.setImage(UIImage(named: "searchimage"), forState: UIControlState.Normal)
        mCartButton.setImage(UIImage(named: "carimage"), forState: UIControlState.Normal)
    }
    
    



}
