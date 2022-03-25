//
//  TabBarViewController.swift
//  MyResumeApp
//
//  Created by Cody Holmes on 3/23/22.
//

import Foundation
import UIKit

protocol TabBarControllerDelegate: AnyObject {
    func didClickProfile()
}

class TabBarViewController: UITabBarController {
    
    weak var delegater: TabBarControllerDelegate?
    let profileButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTabBar()
        setup()
        layout()
    }

}

extension TabBarViewController {
    
    func setup() {
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        profileButton.configuration = .filled()
        profileButton.backgroundColor = UIColor.magenta
        profileButton.layer.borderColor = UIColor.black.cgColor
        profileButton.layer.borderWidth = 2
        profileButton.layer.cornerRadius = 5
        profileButton.configuration?.imagePadding = 8
        profileButton.setTitle("Profile", for: [])
        profileButton.addTarget(self, action: #selector(profileButtonClicked), for: .primaryActionTriggered)
    }
    
    func layout() {
        view.addSubview(profileButton)
        //close button
        NSLayoutConstraint.activate([
            //leading and right two units, each unit is 8 pixels
            profileButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            //top and down two units, each unit is 8 pixels
            profileButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier:2)
        ])
    }
    
    private func hideNavigationBarLine(_ navigationBar: UINavigationBar) {
            let img = UIImage()
            navigationBar.shadowImage = img
            navigationBar.setBackgroundImage(img, for: .default)
            navigationBar.isTranslucent = false
    }
    
    private func setupViews() {
        let vc1 = SkillsViewController()
        let vc2 = ProjectsViewController()
        let vc3 = ExperienceViewController()
        let vc4 = EducationViewController()
        
        vc1.setTabBarImage(imageSFName: "list.dash.header.rectangle", title: "Skills", tag: 0)
        vc2.setTabBarImage(imageSFName: "arrow.left.arrow.right", title: "Projects", tag: 1)
        vc3.setTabBarImage(imageSFName: "ellipsis.circle", title: "Experience", tag: 2)
        vc4.setTabBarImage(imageSFName: "graduationcap", title: "Education", tag: 3)
        
        let nc1 = UINavigationController(rootViewController: vc1)
        let nc2 = UINavigationController(rootViewController: vc2)
        let nc3 = UINavigationController(rootViewController: vc3)
        let nc4 = UINavigationController(rootViewController: vc4)
        

        let tabBarList = [nc1, nc2, nc3, nc4]
        viewControllers = tabBarList
        
        //we changed the rootViewController to our new tabBarController
    }
    
    private func setupTabBar() {
        tabBar.isTranslucent = false
        tabBar.tintColor = generateRandomPastelColor(withMixedColor: UIColor.lightGray)
        tabBar.backgroundColor = UIColor.white
        
    }
}

extension TabBarViewController {
    @objc func profileButtonClicked(sender: UIButton){
        delegater?.didClickProfile()
        }
}






extension TabBarViewController {
    // Adapted from Stack Overflow answer by David Crow http://stackoverflow.com/a/43235
    // Question: Algorithm to randomly generate an aesthetically-pleasing color palette by Brian Gianforcaro
    // Method randomly generates a pastel color, and optionally mixes it with another color
    func generateRandomPastelColor(withMixedColor mixColor: UIColor?) -> UIColor {
        // Randomly generate number in closure
        let randomColorGenerator = { ()-> CGFloat in
            CGFloat(arc4random() % 256 ) / 256
        }
            
        var red: CGFloat = randomColorGenerator()
        var green: CGFloat = randomColorGenerator()
        var blue: CGFloat = randomColorGenerator()
            
        // Mix the color
        if let mixColor = mixColor {
            var mixRed: CGFloat = 0, mixGreen: CGFloat = 0, mixBlue: CGFloat = 0;
            mixColor.getRed(&mixRed, green: &mixGreen, blue: &mixBlue, alpha: nil)
            
            red = (red + mixRed) / 2;
            green = (green + mixGreen) / 2;
            blue = (blue + mixBlue) / 2;
        }
            
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
}



