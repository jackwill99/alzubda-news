//
//  HomeViewCollectionCell.swift
//  alzubda-news
//
//  Created by Tensor Lab on 1/7/24.
//

import UIKit

class HomeCategoryViewCollectionCell: UICollectionViewCell {
    @IBOutlet var lblText: UILabel!
}

class HomeStoryViewCollectionCell: UICollectionViewCell {
    @IBOutlet var imgStory: UIImageView!
}

class HomeNewsViewCollectionCell: UICollectionViewCell {
    @IBOutlet var uiview: UIView!

    @IBOutlet var imgNews: UIImageView!
    @IBOutlet var creator: UILabel!
    @IBOutlet var title: UILabel!
    @IBOutlet var excerpt: UILabel!
}
