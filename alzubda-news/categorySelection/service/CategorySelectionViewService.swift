//
//  CategorySelectionViewService.swift
//  alzubda-news
//
//  Created by Tensor Lab on 12/26/23.
//

import Foundation
import UIKit

class CategorySelectionViewService {
    private var selectedIndex: [Int] = []

    var getSelectedIndex: [Int] {
        return selectedIndex
    }

    public func changeCollectionCell(_ checking: Bool, _ category: CategorySelectionCellProtocol, _ index: Int) {
        if selectedIndex.contains(index) {
            category.checkMark.isHidden = checking ? false : true
            category.overlay.isHidden = checking ? false : true
            if !checking {
                selectedIndex.removeAll(where: { $0 == index })
            }
        } else {
            category.checkMark.isHidden = checking ? true : false
            category.overlay.isHidden = checking ? true : false
            if !checking {
                selectedIndex.append(index)
            }
        }
    }

    public func addLabelCount(lbl: UILabel) {
        let count = lbl.text!.split(separator: "/")
        if Int(count[1]) != nil {
            lbl.text = count[0] + "/" + String(selectedIndex.count)
        }
    }
}
