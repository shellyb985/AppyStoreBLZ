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
    var collectionViewCell : CollectionViewCell?
    var mSelectedCategory : categorylist!
    
    override func viewDidLoad() {
        mChangeButtonImage()
        collectionView.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundimage")!)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundimage")!)
        
        populateCategory(1, range: 10)
        
        collectionView.registerNib(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        super.viewDidLoad()
        collectionView.collectionViewLayout = CustomViewFlowLayout(width : CGRectGetWidth(self.view.frame) , height : CGRectGetHeight(self.view.frame))
        mCategoryViewModelObj = CategoryViewModel()

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //FIXME: populate category
    func populateCategory(start : Int,range : Int)
    {
        mCategoryViewModelObj = CategoryViewModel()
        mCategoryViewModelObj.mFetchCategoryDetailsFromController(start, range: range)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(CategoryViewController.updateViewController(_:)), name: "CategoryViewControllerUpdate", object: nil)
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mCategoryViewModelObj.mTotalCount
    }
    //TODO:Update me
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        //fetch category details
        let category : categorylist? = mCategoryViewModelObj.mGetCategoryDetails(indexPath.row)
        
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        if cell == nil {
            collectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as? CollectionViewCell
            mBindTo(collectionViewCell!, list: category!)
        }
        return collectionViewCell!
    }
    
    func updateViewController(notification : NSNotification) {
        collectionView.reloadData()
    }
    //FIXME:fdgfdrd
    func mChangeButtonImage() {
        mHomeButton.setImage(UIImage(named: "ladyimage"), forState: UIControlState.Normal)
        mVideoButton.setImage(UIImage(named: "videoimage"), forState: UIControlState.Normal)
        mHistoryButton.setImage(UIImage(named: "historyimage"), forState: UIControlState.Normal)
        mSearchButton.setImage(UIImage(named: "searchimage"), forState: UIControlState.Normal)
        mCartButton.setImage(UIImage(named: "carimage"), forState: UIControlState.Normal)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        mSelectedCategory = mCategoryViewModelObj.mCategoryList[indexPath.row]
        performSegueWithIdentifier("CategoryToSubCategory", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "CategoryToSubCategory" {
            let subCategoryViewControllerObj = segue.destinationViewController as! SubCategoryViewContoller
            subCategoryViewControllerObj.mCategory = mSelectedCategory
        }
    }
    
    func mBindTo(cell : CollectionViewCell , list : categorylist) {
        list.name.bindTo(cell.VideoLabel)
        let image : ObservableBuffer<UIImage>? = Utility().fetchImage(list.image).shareNext()
        if image != nil {
            image?.bindTo(cell.VideoImageView)
        }
    }
}
