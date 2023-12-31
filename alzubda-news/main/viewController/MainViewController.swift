//
//  ViewController.swift
//  alzubda-news
//
//  Created by Tensor Lab on 12/21/23.
//

import UIKit

class MainViewController: UIViewController {
    private var isDoneCategorySelection = false

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        if !isDoneCategorySelection {
            //        let categorySelectionVS = CategorySelectionViewStoryboard.getController(to: .CategorySelection)
            //
            //        categorySelectionVS.modalPresentationStyle = .fullScreen
            //        present(categorySelectionVS, animated: true)

            let categorySelectionVC = CategorySelectionViewController()

            categorySelectionVC.modalPresentationStyle = .fullScreen
            present(categorySelectionVC, animated: true, completion: nil)

            isDoneCategorySelection = true
        }
    }
}
