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
    @IBOutlet var newsCollection: UICollectionView!

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

        newsCollection.delegate = self
        newsCollection.dataSource = self
        newsCollection.showsHorizontalScrollIndicator = false

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
        } else if collectionView == storiesCollection {
            return service.getStoriesList.count
        } else {
            print("15")
            return 15
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoriesCollection {
            let category = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCategoryViewCollectionCell", for: indexPath) as! HomeCategoryViewCollectionCell

            category.lblText.text = service.getCategoriesList[indexPath.row]
            category.layer.cornerRadius = 10
            return category
        } else if collectionView == storiesCollection {
            let story = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeStoryViewCollectionCell", for: indexPath) as! HomeStoryViewCollectionCell

            story.imgStory.image = UIImage(systemName: service.getStoriesList[indexPath.row])

            story.layer.cornerRadius = 45
            story.layer.masksToBounds = true
            story.imgStory.layer.masksToBounds = true
            story.clipsToBounds = true

            return story
        } else {
            let news = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeNewsViewCollectionCell", for: indexPath) as! HomeNewsViewCollectionCell

            /// In  UICollectionView, the UICollectionViewCell must have the static width or dynamic width based on the devices. Otherwise, UILabel can't wrap
            news.uiview.widthAnchor.constraint(equalToConstant: view.frame.width - 40).isActive = true

            news.uiview.layer.cornerRadius = 15
            news.imgNews.layer.cornerRadius = 10

            return news
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        /// For newsCollection, don't need to resize the collectionview if there is stackView in ContentView of CollectionCell
        /// Now, I used UIView in ContentView of CollectionCell, so tells the size of the frame when rendering
        if collectionView == newsCollection {
            return CGSize(width: view.frame.width - 40, height: 150)
        }
        return collectionView.frame.size
    }
}
