//
//  CategorySelectionViewCell.swift
//  alzubda-news
//
//  Created by Tensor Lab on 12/21/23.
//

import UIKit

class CategorySelectionViewCell: UICollectionViewCell {
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var img: UIImageView!
    @IBOutlet var overlay: UIView!
    @IBOutlet var checkMark: UIImageView!

    public func config(title: String) {
        lblTitle.text = title
    }
}
