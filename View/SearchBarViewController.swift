//
//  SearchBarViewController.swift
//  AppyStoreApplication
//
//  Created by BridgeIt on 22/07/16.
//  Copyright © 2016 bridgelabz. All rights reserved.
//

import UIKit
import ReactiveKit
import Alamofire
import AVKit
import AVFoundation

class SearchBarViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var backButtonLabel: UIButton!
    @IBOutlet weak var searchButtonLabel: UIButton!
    @IBOutlet weak var inputTextField: UITextField!
    
    var collectionViewCell : CollectionViewCell?
    
    var mSearchViewModelObj = SearchViewMode()
    var mVideoPlayer : AVPlayer!
    var mPlayerViewController : AVPlayerViewController!
    let label = UILabel()
    var searchButtonShow : Bool = true
    var Sview = UIView(frame: CGRect(x: 0, y: 0, width: 540, height: 60))
    var sViewButton : UIButton!
    var headerViewChecker : Bool = true
    var ListCount = 0
    var searchKeyword = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    collectionView.collectionViewLayout = CustomViewFlowLayout(width : CGRectGetWidth(self.view.frame),height : CGRectGetHeight(self.view.frame))   //to set layout for collection view
        collectionView.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundimage.jpg")!) //to set background image for collection view
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundimage.jpg")!) // to set background image for view
        collectionView.registerNib(UINib(nibName: "SearchBarCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SearchBarCell")
        backButtonLabel.setImage(UIImage(named: "backarrow.png"), forState: UIControlState.Normal) //to set back button image
        searchButtonLabel.setImage(UIImage(named: "searchimage.png"), forState: UIControlState.Normal) //to set search button image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mSearchViewModelObj.mTotalSearchCategory
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let searchCategory : SearchCategorylist? = mSearchViewModelObj.mGetSearchCategory(indexPath.row)
        
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        if cell == nil {
            collectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as? CollectionViewCell
            bindData(collectionViewCell!, list: searchCategory!)
        }
        return collectionViewCell!
    }
    
    func bindData(cell : CollectionViewCell,list : SearchCategorylist) {
        list.title.bindTo(cell.VideoLabel)
        list.image.bindTo(cell.VideoImageView)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
//        let url = NSURL(string: mSearchControllerObj.mSearchCategoryList[indexPath.row]["dnld_url"] as! String)
//        mVideoPlayer = AVPlayer(URL: url!)
//        mPlayerViewController = AVPlayerViewController()
//        
//        mPlayerViewController.player = mVideoPlayer
//        self.presentViewController(mPlayerViewController, animated: true ){
//        self.mPlayerViewController.player?.play()
//        }
//        
//        let LocalDB = LocalDataDase()
//        LocalDB.mInsertValueInToHistoryTable(mSearchControllerObj.mSearchCategoryList[indexPath.row] as! [String : AnyObject])
    }
    
//    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
//
//        let cell = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "HeaderView", forIndexPath: indexPath) as! CollectionReusableView
//        cell.mSetBorder()
//        return cell
//    }
    
    func collectionView(collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
            if (headerViewChecker != true ){
                return CGSizeZero
            }
            else {
                   return CGSize(width: (view.frame.size.width), height: 90)
            }
    }
    

    func updataSearchViewController () {
        if mSearchViewModelObj.mTotalSearchCategory > 0 {
            collectionView.reloadData()
        }
        else {
            label.hidden = false
            label.textAlignment = NSTextAlignment.Center
            label.text = "Records Not Found"
            label.textColor = UIColor.whiteColor()
            collectionView.backgroundView = label
        }
    }
    
    @IBAction func backButtonPressed(sender: UIButton) {
        performSegueWithIdentifier("SearchToCategory", sender: nil)
    }
    
    @IBAction func searchButtonPressed(sender: UIButton) {
        searchKeyword = inputTextField.text!
        Sview.hidden = true
        headerViewChecker = false
        if searchButtonShow {
            
            if inputTextField.text == "" {
                
            }
            else {
                searchButtonShow = false
                collectionView.reloadData()
                label.hidden = true
//                mSearchControllerObj.mGetSearchDetails(self, inputText: searchKeyword, offset: ListCount)
                searchButtonLabel.setImage(UIImage(named: "close"), forState: UIControlState.Normal)
            }
        }
        else {
            searchButtonLabel.setImage(UIImage(named: "searchimage.png"), forState: UIControlState.Normal)
            searchButtonShow = true
            inputTextField.text = ""
        }
    }
    
    func mCreateSubVIew() {
        Sview.backgroundColor = UIColor.blackColor()
        collectionView.addSubview(Sview)
    }
    
    @IBAction func CollectionReusableViewButton(sender: UIButton) {
        
        switch(sender.tag) {
        case 1 :
            inputTextField.text = "Rhymes"
            break
        case 2 :
            inputTextField.text = "letters"
            break
        case 3 :
            inputTextField.text = "counting"
            break
        case 4 :
            inputTextField.text = "drawing"
            break
        case 5 :
            inputTextField.text = "science"
            break
        case 6 :
            inputTextField.text = "numbers"
            break
        case 7 :
            inputTextField.text = "puzzles"
            break
        case 8 :
            inputTextField.text = "ABC"
            break
        case 9 :
            inputTextField.text = "reading"
            break
        case 10 :
            inputTextField.text = "alphabet"
            break
        default : break
        }
        searchButtonPressed(sender)
    }
}
