//
//  CategorySelectionViewCell.swift
//  alzubda-news
//
//  Created by Tensor Lab on 12/21/23.
//

import UIKit

class CategorySelectionViewCell: UICollectionViewCell, CategorySelectionCellProtocol {
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var img: UIImageView!
    @IBOutlet var overlay: UIView!
    @IBOutlet var checkMark: UIImageView!

    public func config(title: String) {
        lblTitle.text = title
    }
}

protocol CategorySelectionCellProtocol {
    var lblTitle: UILabel! { get set }
    var img: UIImageView! { get set }
    var overlay: UIView! { get set }
    var checkMark: UIImageView! { get set }
}
