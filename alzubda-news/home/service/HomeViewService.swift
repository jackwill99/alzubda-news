//
//  HomeViewService.swift
//  alzubda-news
//
//  Created by Tensor Lab on 1/7/24.
//

import Foundation
import UIKit

class HomeViewService {
    private var view: UIViewController!

    init(view: UIViewController) {
        self.view = view
    }

    private var isDoneCategorySelection = true

    private var categoriesList: [String] = [
        "hi", "hee", "haha", "dsfwefw",
        "hi", "hee", "haha", "dsfwefw"
    ]
    public var getCategoriesList: [String] {
        return categoriesList
    }

    private var storiesList: [String] = [
        "magnifyingglass", "swift", "swiftdata", "visionpro.fill",
        "camera.macro", "quote.bubble.fill", "shareplay", "figure.walk"
    ]
    public var getStoriesList: [String] {
        return storiesList
    }

    public func showCategorySelectionView() {
        if !isDoneCategorySelection {
            //        let categorySelectionVS = CategorySelectionViewStoryboard.getController(to: .CategorySelection)
            //
            //        categorySelectionVS.modalPresentationStyle = .fullScreen
            //        present(categorySelectionVS, animated: true)

            let categorySelectionVC = CategorySelectionViewController()

            categorySelectionVC.modalPresentationStyle = .fullScreen
            view.present(categorySelectionVC, animated: true, completion: nil)

            isDoneCategorySelection = true
        }
    }
}
