//
//  PagingCollectionViewLayout.swift
//  DemoApp
//
//  Created by 古林俊佑 on 2015/07/19.
//  Copyright (c) 2015年 Shunsuke Furubayashi. All rights reserved.
//

import UIKit

class PagingCollectionViewLayout: UICollectionViewFlowLayout {
 
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
        
        // 左右１ピクセルをはみ出させることで、普通は描画されない横のスライドも描画させる
        // このことで、カードリストのような左右のcellがframe外で表示されるようになる
        // ただし、collectionView本体のclipsToBoundsがfalseになっていないといけない
        let attributes = super.layoutAttributesForElementsInRect(rect)
        for attribute in attributes as! [UICollectionViewLayoutAttributes] {
            var rect = attribute.bounds
            rect.size.width += 1
            attribute.bounds = rect
        }
        
        return attributes
    }
    
}
