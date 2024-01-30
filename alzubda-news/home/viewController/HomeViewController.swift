//
//  HomeViewController.swift
//  alzubda-news
//
//  Created by Tensor Lab on 1/25/24.
//

import UIKit

class HomeViewController: UIViewController {
    var service: HomeViewService!

    // mainView
    var mainStackView: UIStackView!

    // Search Navigation Bar
    var searchStackView: UIStackView!
    var searchFilterView: UIStackView!
    var searchIconView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        service = HomeViewService(view: self)
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor(red: 31/255, green: 33/255, blue: 36/255, alpha: 1)

        buildView()
    }

    override func viewDidAppear(_ animated: Bool) {
        service.showCategorySelectionView()
    }

    private func buildView() {
        // Build the main view of the home view controller
        buildMainStackView()

        // Build search navigation
        buildSearchNav()
        // test white view
        whiteView()
    }

    private func buildMainStackView() {
        mainStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.alignment = .leading
        mainStackView.spacing = 10
        view.addSubview(mainStackView)

        let safeAreaMargin = view.safeAreaLayoutGuide
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: safeAreaMargin.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: safeAreaMargin.trailingAnchor, constant: -20),
            mainStackView.topAnchor.constraint(equalTo: safeAreaMargin.topAnchor, constant: 0),
            mainStackView.bottomAnchor.constraint(equalTo: safeAreaMargin.bottomAnchor, constant: 0)
        ])
    }

    private func buildSearchNav() {
        searchStackView = UIStackView()
        searchStackView.axis = .horizontal
        searchStackView.spacing = 20
        searchStackView.alignment = .center
        searchStackView.distribution = .fill
        mainStackView.addArrangedSubview(searchStackView)
        searchStackView.translatesAutoresizingMaskIntoConstraints = false
        searchStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true

        searchFilterView = UIStackView()
        searchFilterView.axis = .horizontal
        searchFilterView.spacing = 15
        searchFilterView.backgroundColor = UIColor(red: 20/255, green: 20/255, blue: 20/255, alpha: 1)
        searchFilterView.layer.cornerRadius = 10
        searchStackView.addArrangedSubview(searchFilterView)
        searchFilterView.translatesAutoresizingMaskIntoConstraints = false
        searchFilterView.widthAnchor.constraint(greaterThanOrEqualToConstant: 130).isActive = true
        // Search Filter Icon
        let searchFilterIconView = UIView()
        let searchFilterIcon = UIImageView()
        searchFilterIcon.image = UIImage(systemName: "slider.horizontal.3")
        searchFilterIcon.tintColor = .white
        searchFilterIconView.addSubview(searchFilterIcon)
        searchFilterIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchFilterIcon.widthAnchor.constraint(equalToConstant: 35),
            searchFilterIcon.heightAnchor.constraint(equalToConstant: 35),
            searchFilterIcon.centerYAnchor.constraint(equalTo: searchFilterIconView.centerYAnchor),
            searchFilterIcon.leadingAnchor.constraint(equalTo: searchFilterIconView.leadingAnchor,constant: 10),
        ])
        searchFilterView.addArrangedSubview(searchFilterIconView)
        searchFilterIconView.translatesAutoresizingMaskIntoConstraints = false
        searchFilterIconView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        searchFilterIconView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        // Search Filter Label
        let searchFilterLabel = UILabel()
        searchFilterLabel.text = "Country"
        searchFilterLabel.font = UIFont.systemFont(ofSize: 17.0)
        searchFilterLabel.textColor = .lightGray
        searchFilterView.addArrangedSubview(searchFilterLabel)
        
        // Trailling Search Icon View
        searchIconView = UIImageView()
        searchIconView.image = UIImage(systemName: "magnifyingglass")
        searchIconView.tintColor = .white
        searchStackView.addArrangedSubview(searchIconView)
        searchIconView.translatesAutoresizingMaskIntoConstraints = false
        searchIconView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        searchIconView.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }

    private func whiteView() {
        var stack = UIStackView()
        stack.axis = .horizontal

        mainStackView.addArrangedSubview(stack)

        var label = UILabel()
        label.text = "hello"
        stack.addArrangedSubview(label)
    }
}
