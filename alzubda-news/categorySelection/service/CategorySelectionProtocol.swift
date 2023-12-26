//
//  CategorySelectionCellProtocol.swift
//  alzubda-news
//
//  Created by Tensor Lab on 12/26/23.
//

import Foundation
import UIKit

protocol CategorySelectionCellProtocol {
    var lblTitle: UILabel! { get set }
    var img: UIImageView! { get set }
    var overlay: UIView! { get set }
    var checkMark: UIImageView! { get set }
}
