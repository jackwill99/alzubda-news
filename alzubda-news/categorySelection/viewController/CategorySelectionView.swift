//
//  CategorySelectionViewController.swift
//  alzubda-news
//
//  Created by Tensor Lab on 12/21/23.
//

import UIKit

class CategorySelectionView: UIViewController {
    @IBOutlet var categoryCollection: UICollectionView!
    @IBOutlet var selectCountView: UIView!
    @IBOutlet var lblSelectCount: UILabel!
    @IBOutlet var btnConfirm: UIButton!

    var selectedIndex: [Int] = []

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
}

extension CategorySelectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let category = collectionView.dequeueReusableCell(withReuseIdentifier: "CategorySelectionViewCell", for: indexPath) as! CategorySelectionViewCell

        addImgConstraint(category.img)
        category.layer.cornerRadius = 15
        category.checkMark.isHidden = true
        category.overlay.layer.cornerRadius = 15

        return category
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: getWidth, height: getWidth)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let category = collectionView.cellForItem(at: indexPath) as? CategorySelectionViewCell else { return }

        changeCollectionCell(category, indexPath.row)

        let count = lblSelectCount.text!.split(separator: "/")
        if Int(count[1]) != nil {
            lblSelectCount.text = count[0] + "/" + String(selectedIndex.count)
        }
    }

    private func changeCollectionCell(_ category: CategorySelectionViewCell, _ index: Int) {
        if selectedIndex.contains(index) {
            category.checkMark.isHidden = true
            category.overlay.isHidden = false
            selectedIndex.removeAll(where: { $0 == index })
        } else {
            category.checkMark.isHidden = false
            category.overlay.isHidden = true
            selectedIndex.append(index)
        }
    }

    private func addImgConstraint(_ img: UIImageView) {
        img.translatesAutoresizingMaskIntoConstraints = false
        img.widthAnchor.constraint(equalToConstant: getWidth).isActive = true
        img.heightAnchor.constraint(equalToConstant: getWidth).isActive = true
        img.layer.cornerRadius = 15
    }
}
