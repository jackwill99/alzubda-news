//
//  HomeViewCollectionCell.swift
//  alzubda-news
//
//  Created by Tensor Lab on 1/7/24.
//

import UIKit

class HomeCategoryViewCollectionCell: UICollectionViewCell, HomeCategoryCollectionCellProtocol {
    @IBOutlet var lblText: UILabel!
}

protocol HomeCategoryCollectionCellProtocol {
    var lblText: UILabel! { get set }
}

class HomeStoryViewCollectionCell: UICollectionViewCell {
    @IBOutlet var imgStory: UIImageView!
}

protocol HomeStoryCollectionCellProtocol {
    var imgStory: UIImageView! { get set }
}

class HomeNewsViewCollectionCell: UICollectionViewCell, HomeNewsCollectionCellProtocol {
    @IBOutlet var uiview: UIView!

    @IBOutlet var imgNews: UIImageView!
    @IBOutlet var creator: UILabel!
    @IBOutlet var title: UILabel!
    @IBOutlet var excerpt: UILabel!
}

protocol HomeNewsCollectionCellProtocol {
    var uiview: UIView! { get set }
    var imgNews: UIImageView! { get set }
    var creator: UILabel! { get set }
    var title: UILabel! { get set }
    var excerpt: UILabel! { get set }
}
