//
//  ViewController.swift
//  alzubda-news
//
//  Created by Tensor Lab on 12/21/23.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func goToSelection() {
//        let categorySelectionVC = CategorySelectionView.getController(to: .CategorySelection)
//
//        categorySelectionVC.modalPresentationStyle = .fullScreen
//        present(categorySelectionVC, animated: true)
        let categorySelectionVC = CategorySelectionViewController.getController(to: .CategorySelection)

        categorySelectionVC.modalPresentationStyle = .fullScreen
        present(categorySelectionVC, animated: true)
    }
}