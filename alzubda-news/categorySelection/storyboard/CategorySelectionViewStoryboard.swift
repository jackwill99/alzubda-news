//
//  CategorySelectionViewController.swift
//  alzubda-news
//
//  Created by Tensor Lab on 12/21/23.
//

import UIKit

class CategorySelectionViewStoryboard: UIViewController {
    @IBOutlet var categoryCollection: UICollectionView!
    @IBOutlet var selectCountView: UIView!
    @IBOutlet var lblSelectCount: UILabel!
    @IBOutlet var btnConfirm: UIButton!

    let service = CategorySelectionViewService()

    var getWidth: CGFloat {
        return (view.frame.size.width - 60) / 3
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        categoryCollection.delegate = self
        categoryCollection.dataSource = self

        btnConfirm.layer.cornerRadius = 10
        selectCountView.layer.cornerRadius = 10
    }

    @IBAction func onPressedBack() {
        dismiss(animated: true)
    }
}

extension CategorySelectionViewStoryboard: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let category = collectionView.dequeueReusableCell(withReuseIdentifier: "CategorySelectionViewCell", for: indexPath) as! CategorySelectionViewCell

        addImgConstraint(category.img)
        category.layer.cornerRadius = 15
        category.overlay.layer.cornerRadius = 15

        service.changeCollectionCell(true, category, indexPath.row)

        return category
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: getWidth, height: getWidth)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let category = collectionView.cellForItem(at: indexPath) as? CategorySelectionViewCell else { return }

        service.changeCollectionCell(false, category, indexPath.row)

        service.addLabelCount(lbl: lblSelectCount)
    }

    private func addImgConstraint(_ img: UIImageView) {
        img.translatesAutoresizingMaskIntoConstraints = false
        img.widthAnchor.constraint(equalToConstant: getWidth).isActive = true
        img.heightAnchor.constraint(equalToConstant: getWidth).isActive = true
        img.layer.cornerRadius = 15
    }
}
