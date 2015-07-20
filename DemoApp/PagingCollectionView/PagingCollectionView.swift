//
//  PagingCollectionView.swift
//  DemoApp
//
//  Created by 古林俊佑 on 2015/07/19.
//  Copyright (c) 2015年 Shunsuke Furubayashi. All rights reserved.
//

import UIKit

class PagingCollectionView: UIView {

    // MARK: - Properties
    internal let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: UICollectionViewFlowLayout())
    internal var contentSize: CGSize {
        return CGSizeMake(CGRectGetWidth(UIScreen.mainScreen().bounds) - 30, CGRectGetWidth(UIScreen.mainScreen().bounds) - 30)
    }
    
    // MARK: - Init
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initView()
    }
    
    private func initView() {
        
        self.collectionView.backgroundColor = self.backgroundColor
        self.collectionView.frame = CGRectMake(15.0, 15.0, self.contentSize.width, self.contentSize.height)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.showsVerticalScrollIndicator = false
        self.collectionView.clipsToBounds = false
        self.collectionView.pagingEnabled = true
        self.collectionView.alwaysBounceHorizontal = true
        // For Cell
        self.collectionView.registerNib(UINib(nibName: "PagingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PagingCollectionViewCell")
        
        // Change layout
        let layout = PagingCollectionViewLayout()
        layout.scrollDirection = .Horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        self.collectionView.setCollectionViewLayout(layout, animated: false)
        
        self.addSubview(self.collectionView)
    }

    // MARK: - Override Methods
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        if !CGRectContainsPoint(self.collectionView.frame, point) {
            return self.collectionView
        }
        return super.hitTest(point, withEvent: event)
    }
    
}

// MARK: - UICollectionView DataSource
extension PagingCollectionView: UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PagingCollectionViewCell", forIndexPath: indexPath) as! PagingCollectionViewCell
        
        return cell
    }
    
}

// MARK: - UICollectionView Delegate
extension PagingCollectionView: UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
         return self.contentSize
    }

}
