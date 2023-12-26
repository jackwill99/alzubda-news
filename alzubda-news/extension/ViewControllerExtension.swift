//
//  viewControllerExtension.swift
//  alzubda-news
//
//  Created by Tensor Lab on 12/21/23.
//

import Foundation
import UIKit

extension UIViewController {
    static func getController(to appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(to: self)
    }
}
