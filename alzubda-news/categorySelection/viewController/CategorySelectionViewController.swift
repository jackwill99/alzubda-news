//
//  CategorySelectionViewController.swift
//  alzubda-news
//
//  Created by Tensor Lab on 12/21/23.
//

import UIKit

class CategorySelectionViewController: UIViewController {
    var viewContainer: UIStackView!
    // navigation bar
    var navigationBar: UIStackView!
    var counterView: UIView!
    var counterLabel: UILabel!
    var backButton: UIButton!
    var bottomNavBar: UIStackView!
    // categories collection
    var categoriesCollectionView: UICollectionView!
    // confirm
    var confirmBtn: UIButton!

    let service = CategorySelectionViewService()

    var getWidth: CGFloat {
        return (view.frame.size.width - 60)/3
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 31/255, green: 33/255, blue: 36/255, alpha: 1)

        // Build UIView
        build()
    }

    private func build() {
        viewContainer = UIStackView()
        viewContainer.axis = .vertical
        viewContainer.spacing = 10
        view.addSubview(viewContainer)

        let safeArea = view.safeAreaLayoutGuide
//        let margins = view.layoutMarginsGuide
        viewContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewContainer.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            viewContainer.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            viewContainer.topAnchor.constraint(equalTo: safeArea.topAnchor),
            viewContainer.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])

        buildNavigationBar()
        viewContainer.addArrangedSubview(navigationBar)

        buildCategoriesCollectionView()
        viewContainer.addArrangedSubview(categoriesCollectionView)

        buildConfirmButton()
        viewContainer.addArrangedSubview(confirmBtn)
    }

    private func buildNavigationBar() {
        navigationBar = UIStackView()
        navigationBar.axis = .vertical
        navigationBar.alignment = .leading
        navigationBar.distribution = .fill
        navigationBar.spacing = 10
        navigationBar.heightAnchor.constraint(equalToConstant: 90).isActive = true

        buildNavBackButton()
        buildNavBottomView()
    }

    // MARK: - Navigation Back Button

    private func buildNavBackButton() {
        backButton = UIButton()
        backButton.tintColor = .lightGray
        var configuration = UIButton.Configuration.plain()
//            configuration.title = "Back"
        configuration.image = UIImage(systemName: "chevron.backward")
//            configuration.titlePadding = 10
//            configuration.imagePadding = 10
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: -10, bottom: 0, trailing: 0)
        backButton.configuration = configuration

        // constraints
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
        navigationBar.addArrangedSubview(backButton)

        backButton.addTarget(self, action: #selector(onPressedBack), for: .touchUpInside)
    }

    @objc func onPressedBack(_ sender: UIButton) {
        dismiss(animated: true)
    }

    // MARK: - Navigation Bottom View

    private func buildNavBottomView() {
        bottomNavBar = UIStackView()
        bottomNavBar.axis = .horizontal
        bottomNavBar.spacing = 20
        navigationBar.addArrangedSubview(bottomNavBar)
        // bottomNavBar constraints
        bottomNavBar.translatesAutoresizingMaskIntoConstraints = false
        bottomNavBar.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor, constant: 0).isActive = true

        counterView = UIView()
        counterLabel = UILabel()
        counterLabel.text = "10/0"
        counterLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        counterLabel.textColor = .white
        counterView.addSubview(counterLabel)
        // counterLabel constraints
        counterLabel.translatesAutoresizingMaskIntoConstraints = false
        counterLabel.centerXAnchor.constraint(equalTo: counterView.centerXAnchor).isActive = true
        counterLabel.centerYAnchor.constraint(equalTo: counterView.centerYAnchor).isActive = true

        counterView.backgroundColor = UIColor(red: 0/255, green: 196/256, blue: 188/255, alpha: 1)
        counterView.layer.cornerRadius = 10
        // counterView constraints
        counterView.translatesAutoresizingMaskIntoConstraints = false
        counterView.widthAnchor.constraint(equalToConstant: 80).isActive = true

        let titleView = UIStackView()
        titleView.axis = .vertical
        titleView.distribution = .fillEqually
        let titleLabel = UILabel()
        titleLabel.text = "Title"
        titleLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        titleLabel.textAlignment = .right
        titleLabel.textColor = .white
        let descLabel = UILabel()
        descLabel.text = "Description"
        descLabel.textColor = .lightGray
        descLabel.textAlignment = .right

        // Subview of titleView
        titleView.addArrangedSubview(titleLabel)
        titleView.addArrangedSubview(descLabel)

        // Subview of bottomNavBar
        bottomNavBar.addArrangedSubview(counterView)
        bottomNavBar.addArrangedSubview(titleView)
    }

    // MARK: - Categories Collection View

    private func buildCategoriesCollectionView() {
        // Create an instance of UICollectionViewFlowLayout since you cant
        // Initialize UICollectionView without a layout
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10

        categoriesCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate = self
        categoriesCollectionView.register(CategorySelectionCell.self, forCellWithReuseIdentifier: "CategorySelectionCell")
        categoriesCollectionView.showsVerticalScrollIndicator = false
        categoriesCollectionView.backgroundColor = .clear
    }

    // MARK: - Confirm button

    private func buildConfirmButton() {
        confirmBtn = UIButton()
        confirmBtn.backgroundColor = UIColor(red: 0/255, green: 196/255, blue: 188/255, alpha: 1)
        confirmBtn.tintColor = .white
        confirmBtn.layer.cornerRadius = 10

        var configuration = UIButton.Configuration.plain()
        configuration.title = "Confirm"
        confirmBtn.configuration = configuration

        // constraints
        confirmBtn.translatesAutoresizingMaskIntoConstraints = false
        confirmBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}

extension CategorySelectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let category = collectionView.dequeueReusableCell(withReuseIdentifier: "CategorySelectionCell", for: indexPath) as! CategorySelectionCell
        category.addImgConstraint(width: getWidth)
        service.changeCollectionCell(true, category, indexPath.row)

        return category
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let category = collectionView.cellForItem(at: indexPath) as? CategorySelectionCell else { return }

        service.changeCollectionCell(false, category, indexPath.row)

        service.addLabelCount(lbl: counterLabel)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: getWidth, height: getWidth)
    }
}

// MARK: - Category Selection Cell

class CategorySelectionCell: UICollectionViewCell, CategorySelectionCellProtocol {
    // uiviews
    var lblTitle: UILabel!
    var img: UIImageView!
    var overlay: UIView!
    var checkMark: UIImageView!

    // initWithFrame to init view from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }

    // initWithCode to init view from xib or storyboard
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }

    private func buildLblTitle() {
        lblTitle = UILabel()
        lblTitle.text = "Label"
        lblTitle.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        lblTitle.textColor = .white
        lblTitle.textAlignment = .center
    }

    private func buildImg() {
        img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 15
        img.clipsToBounds = true
        img.image = UIImage(named: "001")
    }

    private func buildOverlayView() {
        overlay = UIView()
        overlay.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
        overlay.layer.cornerRadius = 15
        overlay.isHidden = true
    }

    private func buildCheckMarkView() {
        checkMark = UIImageView()
        checkMark.image = UIImage(systemName: "checkmark.seal.fill")
        checkMark.translatesAutoresizingMaskIntoConstraints = false
        checkMark.tintColor = .white
        NSLayoutConstraint.activate([
            checkMark.widthAnchor.constraint(equalToConstant: 30),
            checkMark.heightAnchor.constraint(equalToConstant: 30)
        ])
        checkMark.isHidden = true
    }

    public func addImgConstraint(width: CGFloat) {
        img.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            img.topAnchor.constraint(equalTo: topAnchor),
            img.bottomAnchor.constraint(equalTo: bottomAnchor),
            img.leftAnchor.constraint(equalTo: leftAnchor),
            img.rightAnchor.constraint(equalTo: rightAnchor),
            img.widthAnchor.constraint(equalToConstant: width),
            img.heightAnchor.constraint(equalToConstant: width)
        ])
    }

    private func loadView() {
//        backgroundColor = .blue

        buildImg()
        addSubview(img)

        buildLblTitle()
        addSubview(lblTitle)
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lblTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            lblTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            lblTitle.rightAnchor.constraint(equalTo: rightAnchor, constant: 0)
        ])

        buildOverlayView()
        addSubview(overlay)
        overlay.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            overlay.topAnchor.constraint(equalTo: topAnchor),
            overlay.bottomAnchor.constraint(equalTo: bottomAnchor),
            overlay.leftAnchor.constraint(equalTo: leftAnchor),
            overlay.rightAnchor.constraint(equalTo: rightAnchor)
        ])

        buildCheckMarkView()
        addSubview(checkMark)
        NSLayoutConstraint.activate([
            checkMark.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            checkMark.rightAnchor.constraint(equalTo: rightAnchor, constant: -10)
        ])
    }
}
