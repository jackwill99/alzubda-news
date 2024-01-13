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
    @IBOutlet var storiesCollection: UICollectionView!

    var service: HomeViewService!

    override func viewDidLoad() {
        super.viewDidLoad()

        service = HomeViewService(view: self)
        categoriesCollection.delegate = self
        categoriesCollection.dataSource = self
        categoriesCollection.showsHorizontalScrollIndicator = false

        storiesCollection.delegate = self
        storiesCollection.dataSource = self
        storiesCollection.showsHorizontalScrollIndicator = false

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
        if collectionView == categoriesCollection {
            return service.getCategoriesList.count
        } else {
            return service.getStoriesList.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoriesCollection {
            let category = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCategoryViewCollectionCell", for: indexPath) as! HomeCategoryViewCollectionCell

            category.lblText.text = service.getCategoriesList[indexPath.row]
            category.layer.cornerRadius = 10
            return category
        } else {
            let story = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeStoryViewCollectionCell", for: indexPath) as! HomeStoryViewCollectionCell

            story.imgStory.image = UIImage(systemName: service.getStoriesList[indexPath.row])
            story.layer.masksToBounds = true
            story.layer.cornerRadius = story.layer.frame.width / 2

            return story
        }
    }
}
