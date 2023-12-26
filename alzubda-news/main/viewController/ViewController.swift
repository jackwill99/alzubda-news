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
//        let categorySelectionVS = CategorySelectionViewStoryboard.getController(to: .CategorySelection)
//
//        categorySelectionVS.modalPresentationStyle = .fullScreen
//        present(categorySelectionVS, animated: true)

        let categorySelectionVC = CategorySelectionViewController()

        categorySelectionVC.modalPresentationStyle = .fullScreen
        present(categorySelectionVC, animated: true)
    }
}
