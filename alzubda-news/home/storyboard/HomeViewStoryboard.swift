//
//  HomeViewStoryboard.swift
//  alzubda-news
//
//  Created by Tensor Lab on 12/31/23.
//

import UIKit

class HomeViewStoryboard: UIViewController {
    @IBOutlet var categoriesSlider: UIView!
    @IBOutlet var countryStackView: UIStackView!
    @IBOutlet var categoriesCollection: UICollectionView!

    var service: HomeViewService!

    override func viewDidLoad() {
        super.viewDidLoad()

        service = HomeViewService(view: self)
        categoriesCollection.delegate = self
        categoriesCollection.dataSource = self
        categoriesCollection.showsHorizontalScrollIndicator = false

        navigationController?.isNavigationBarHidden = true
        categoriesSlider.layer.cornerRadius = 6
        countryStackView.layer.cornerRadius = 10

//        let layout = categoriesCollection.collectionViewLayout
//        if let flowLayout = layout as? UICollectionViewFlowLayout {
//        }
    }

    override func viewDidAppear(_ animated: Bool) {
        service.showCategorySelectionView()
    }
}

extension HomeViewStoryboard: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return service.getCategoriesList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let category = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeViewCollectionCell", for: indexPath) as! HomeViewCollectionCell

        category.lblText.text = service.getCategoriesList[indexPath.row]
        category.layer.cornerRadius = 10
        return category
    }
}
