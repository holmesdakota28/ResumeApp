//
//  UIViewControllerUtils.swift
//  MyResumeApp
//
//  Created by Cody Holmes on 3/23/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func setTabBarImage(imageSFName: String, title: String, tag: Int) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageSFName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: tag)
    }
    
}
