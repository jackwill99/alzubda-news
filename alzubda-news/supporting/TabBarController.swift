//
//  TabBarController.swift
//  alzubda-news
//
//  Created by Tensor Lab on 12/30/23.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        
        setup()
        
        tabBar.unselectedItemTintColor = .purple
        
        // default selected index
//        selectedIndex = 1
    }
    
    private func setup() {
        let home = createNav(with: "Home", and: UIImage(systemName: "house"), vc: MainViewController())
        
        let history = createNav(with: "History", and: UIImage(systemName: "clock"), vc: T1ViewController())
        
        let exercise = createNav(with: "Exercise", and: UIImage(systemName: "cloud.snow"), vc: T3ViewController())
        
        setViewControllers([home, history, exercise], animated: true)
    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        nav.navigationItem.title = title + " Controller"
        return nav
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print(selectedIndex)
    }
}
