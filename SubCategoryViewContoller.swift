//
//  SubCategoryViewContoller.swift
//  AppyStoreApplication
//  Purpose
//  1. This class display display all videos of selected category
//  2. And play video
//
//  Created by BridgeIt on 16/07/16.
//  Copyright © 2016 bridgelabz. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import AVKit
import AVFoundation
import ReactiveKit
import ReactiveUIKit

class SubCategoryViewContoller: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var mBackButtonLabel: UIButton!
    
    @IBOutlet weak var mVideoButtonLabel: UIButton!
    
    @IBOutlet weak var mHistoryButtonLabel: UIButton!
    
    @IBOutlet weak var mSearchButtonLabel: UIButton!
    
    @IBOutlet weak var mCartButtonLabel: UIButton!
    
    var mSubcategoryViewModelObj : SubCategoryViewModel!
    var mHistory   = NSMutableArray()
    var mVideoPlayer : AVPlayer!
    var mPlayerViewController : AVPlayerViewController!
    var index : Int!
    var historyChecker = false
    var mSelectedCategory : AnyObject?
    var mSelectedCategoryCount = 0
    var ListCount = 5
    
    override func viewDidLoad() {
        mChangeButtonImage()
        collectionView.collectionViewLayout = CustomViewFlowLayout(width : CGRectGetWidth(self.view.frame),height : CGRectGetHeight(self.view.frame))
        mVideoButtonLabel.setImage(UIImage(named: "videobackground.png"), forState: UIControlState.Normal)
        super.viewDidLoad()
     
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundimage.jpg")!)
        collectionView.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundimage.jpg")!)
        collectionView.registerNib(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        
        mSubcategoryViewModelObj = SubCategoryViewModel()
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SubCategoryViewContoller.updateSubcategoryView(_:)), name: "SubCategoryViewControllerUpdate", object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            //return mSubcategoryViewModelObj.mSubcategoryList.count
        return ListCount
    }
    
    //method to create collection view cell
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

        print("\(indexPath) : \(indexPath.row)")
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as! CollectionViewCell
        cell.VideoLabel.text = "hello"
       // mSubcategoryViewModelObj.mSubcategoryList[indexPath.row].title.bindTo(cell.VideoLabel)

        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
//        index = indexPath.row
//        mHistory.addObject(indexPath.row as Int)
//        let url = NSURL(string: mSubCategoryControllerObj.mSubCatagoryList[index]["dnld_url"] as! String)
//        mVideoPlayer = AVPlayer(URL: url!)
//        mPlayerViewController = AVPlayerViewController()
//        
//        mPlayerViewController.player = mVideoPlayer
//        self.presentViewController(mPlayerViewController, animated: true ){
//            self.mPlayerViewController.player?.play()
//        }
//        
//        let LocalDB = LocalDataDase()
//        LocalDB.mInsertValueInToHistoryTable(mSubCategoryControllerObj.mSubCatagoryList[index] as! [String : AnyObject])
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
//        ListCount += 9
//        if (ListCount < mSubCategoryControllerObj.mSubCategoryListCount) {
//            mSubCategoryControllerObj.mGetSubCategoryDetails(self , category: mSelectedCategory,offset : ListCount)
//        }
//        else {
//            
//        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

    }
    
    //Method to update collection view
    func updateSubcategoryView (notification : NSNotification) {
        collectionView.reloadData()
    }
    
    @IBAction func mBackButtonPressed(sender: UIButton) {

        mChangeButtonImage()
        mBackButtonLabel.setImage(UIImage(named: "backY.png"), forState: UIControlState.Normal)
        performSegueWithIdentifier("CategoryView", sender: nil)
        
    }
    
    @IBAction func mVideoButtonPressed(sender: UIButton) {
        mChangeButtonImage()
        mVideoButtonLabel.setImage(UIImage(named: "videobackground.png"), forState: UIControlState.Normal)
        
    }
    
    @IBAction func mHistoryButtonPressed(sender: UIButton) {
        mChangeButtonImage()
        mHistoryButtonLabel.setImage(UIImage(named: "historybackground.png"), forState: UIControlState.Normal)
        performSegueWithIdentifier("SubCategoryToHistory", sender: nil)
    }
    
    @IBAction func mSearchButtonPressed(sender: UIButton) {
        mChangeButtonImage()
        mSearchButtonLabel.setImage(UIImage(named: "searchbackground.png"), forState: UIControlState.Normal)
        
        collectionView.insertItemsAtIndexPaths([NSIndexPath.init(forRow: 5, inSection: 0)])
    }
    
    @IBAction func mCartButtonPressed(sender: UIButton) {
//        mChangeButtonImage()
//        mCartButtonLabel.setImage(UIImage(named: "cartbackground.png"), forState: UIControlState.Normal)
        
         ListCount += 1
        
        let indexpath = NSIndexPath(forItem: 4, inSection: 0)
        collectionView.insertItemsAtIndexPaths([indexpath])
   
        
       
    }
    //method to change background image of buttons
    func mChangeButtonImage () {
        mBackButtonLabel.setImage(UIImage(named: "backarrow.png"), forState: UIControlState.Normal)
        mVideoButtonLabel.setImage(UIImage(named: "videoimage.png"), forState: UIControlState.Normal)
        mHistoryButtonLabel.setImage(UIImage(named: "historyimage.png"), forState: UIControlState.Normal)
        mSearchButtonLabel.setImage(UIImage(named: "searchimage.png"), forState: UIControlState.Normal)
        mCartButtonLabel.setImage(UIImage(named: "carimage.png"), forState: UIControlState.Normal)
    }   
}
